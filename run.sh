#!/bin/env bash

set -e
# set -o xtrace

if [ $# -lt 2 ]; then
  echo "usage ./run.sh <PACKAGE_NAME> <COUNTRY_CODE> [VERSION]"
  exit 1
fi

PACKAGE_NAME="$1"
COUNTRY_CODE="$2"

VERSION="${3:-"$(apkdown get-latest -p $PACKAGE_NAME)"}"
./download.sh $PACKAGE_NAME "$VERSION"
tbctk-cli extract pkg -c $COUNTRY_CODE -g $VERSION -o ./game_data/$COUNTRY_CODE/$VERSION/ -p "apks/$PACKAGE_NAME/$VERSION-merged.apk" -f --packs DataLocal resLocal resLocal_fr resLocal_it resLocal_de resLocal_es resLocal_th --ignore-no-exist

cd ./game_data/$COUNTRY_CODE/$VERSION/
tar -I 'xz -9' -cvf ../../../out/$COUNTRY_CODE-$VERSION.tar.xz .
