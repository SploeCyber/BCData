#!/usr/bin/env bash

set -e

if [ $# -lt 2 ]; then
  echo "usage: ./merge.sh <package_name> <version>"
  exit 1
fi
 
PKG_NAME="$1"
VERSION="$2"

OUTPATH="apks/${PKG_NAME}/${VERSION}-merged.apk"

if [ -f "$OUTPATH" ]; then
  echo "skipping merge as $OUTPATH already exists"
  exit 0
fi

java -jar lib/APKEditor.jar m -i "apks/${PKG_NAME}/${VERSION}.apk" -o "${OUTPATH}" -extractNativeLibs true -f
