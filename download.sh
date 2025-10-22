#!/usr/bin/env bash

set -e

if [ $# -lt 1 ]; then
  echo "usage ./download.sh <package_name> [version]"
  exit 1
fi

PACKAGE_NAME="$1"
VERSION="$2"

if [ "$VERSION" == "" ]; then
  VERSION=apkdown get-latest --package-name "$PACKAGE_NAME"
fi

apkdown download --package-name "$PACKAGE_NAME" --version "${VERSION}" --output-path "apks/$PACKAGE_NAME/$VERSION.apk" --skip-if-exists

./merge.sh "${PACKAGE_NAME}" "${VERSION}"
