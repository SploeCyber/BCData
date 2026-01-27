#!/bin/bash

if [ $# -lt 1 ]; then
  echo "usage ./gitlab_push.sh <PROJECT_ID>"
  exit 1
fi

TOKEN="$(cat .gltoken)"
PROJECT_ID="$1"
PACKAGE_NAME="bc-data"
PACKAGE_VERSION="0"
DIRECTORY_PATH="./out"

for file in "$DIRECTORY_PATH"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        curl --location --header "PRIVATE-TOKEN: $TOKEN" \
             --upload-file "$file" \
             "https://gitlab.com/api/v4/projects/$PROJECT_ID/packages/generic/$PACKAGE_NAME/$PACKAGE_VERSION/$filename"
        echo "Uploaded: $filename"
    fi
done
