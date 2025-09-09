#!/bin/env bash

set -e
set -o xtrace

latest_en="$(apkdown get-latest -p jp.co.ponos.battlecatsen)"
en_path="apks/jp.co.ponos.battlecatsen/$latest_en-merged.apk"

# base en
tbctk-cli download-server -c en -g $latest_en -o ./server_files/en/en/ -f $en_path

# fr
tbctk-cli download-server -c en -g $latest_en -l fr -o ./server_files/en/fr/ -f $en_path

# it
tbctk-cli download-server -c en -g $latest_en -l it -o ./server_files/en/it/ -f $en_path

# de
tbctk-cli download-server -c en -g $latest_en -l de -o ./server_files/en/de/ -f $en_path

# es
tbctk-cli download-server -c en -g $latest_en -l es -o ./server_files/en/es/ -f $en_path

# th
tbctk-cli download-server -c en -g $latest_en -l th -o ./server_files/en/th/ -f $en_path

latest_jp="$(apkdown get-latest -p jp.co.ponos.battlecats)"
jp_path="apks/jp.co.ponos.battlecats/$latest_jp-merged.apk"

tbctk-cli download-server -c jp -g $latest_jp -o ./server_files/jp/ -f $jp_path


latest_kr="$(apkdown get-latest -p jp.co.ponos.battlecatskr)"
kr_path="apks/jp.co.ponos.battlecatskr/$latest_kr-merged.apk"

tbctk-cli download-server -c kr -g $latest_kr -o ./server_files/kr/ -f $kr_path

latest_tw="$(apkdown get-latest -p jp.co.ponos.battlecatstw)"
tw_path="apks/jp.co.ponos.battlecatstw/$latest_tw-merged.apk"

tbctk-cli download-server -c tw -g $latest_tw -o ./server_files/tw/ -f $tw_path
