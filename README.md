# BCData

Collection of game data for The Battle Cats. Used in
[BCSFE-Python](https://codeberg.org/fieryhenry/BCSFE-Python).

## Adding new game data

Mostly a guide for me tbh.

### Prerequisites

- [apkdown](https://codeberg.org/fieryhenry/apkdown)
- [tbctk](https://codeberg.org/fieryhenry/tbctk) - not yet released (sorry!)

The process to add new game is as follows:

1. Run the [./run.sh](./run.sh) script:

```sh
./run.sh <package_name> <country_code> [version]
./run.sh jp.co.ponos.battlecatsen en # latest en version
./run.sh jp.co.ponos.battlecats jp 14.7.0 # jp version 14.7.0
```

This will download an xapk, merge it into an normal apk and place it in the `./apks` directory.

It will decrypt the game data into the `./game_data` directory.

It will archive and compress game data into the `./out` directory in the current working directory.

2. Commit the changes to the `./game_data` directory to the repository.

3. Create a tag for this version. The name is as follows:

- `v<version_name>` if this version is for all regions. e.g `v14.7.0`
- `v<version_name>-<region_code1>[-version_code2][-version_code3]` if this version is for a
specific region. e.g `v14.7.0-jp` or `v14.7.0-en-kr-tw`. The priority for region codes is `jp`, `en`,
`kr`, `tw`. So `jp` should be the first region code and `tw` the last.

4. Create a release for the tag, add the associated archive (the file(s) in `./out`) to the release
assets

5. Update `metadata.json` to add the new version info.

## Using your own game data repo

If you want to use your own game data repo in the save editor, you just need to set the game data
url in the editor config to point to a file with the same format as the `metadata.json` file in
this repo. So it must be structured similarly to this:

```json
{
  "base_url": "https://example.com/some-url-that-is-prepended-before-each-version-asset/",
  "versions": {
    "jp": {
      "<version_code>": "<url>",
      "<version_code2>": "<url2>",
      "etc": "..."
    },
    "en": {
      "14.7.0": "some-url-part-that-is-appended-to-the-base-url.tar.xz"
    },
    "kr": {
      "...": "..."
    },
    "tw": {
      "...": "..."
    }
  }
}
```

Obviously you should replace the `...` and other placeholders with actual content.

The tar.xz files should have the following structure:

```text
|-- DataLocal/
|-- |-- unitbuy.csv
|-- |-- itemShopData.tsv
|-- |-- ...
|-- resLocal/
|-- |-- localizable.tsv
|-- |-- Unit_Explanation1_en.csv
|-- |-- ...
|-- resLocal_fr/
|-- |-- ...
|-- resLocal_it/
|-- |-- ...
|-- resLocal_de/
|-- |-- ...
|-- resLocal_es/
|-- |-- ...
|-- resLocal_th/
|-- |-- ...
```

Note that `resLocal_<lang>` packs only exist for en versions, so you won't have them in jp, kr or tw.
