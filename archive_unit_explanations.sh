#!/bin/env bash

set -e

COUNTRY_CODE=$1
GAME_VERSION=$2
LOCALE=$3

BASE_DIR="game_data/$COUNTRY_CODE/$GAME_VERSION"

if [ "$LOCALE" == "base" ]; then
    LOCALE_DIR="resLocal"
    OUTPUT_DIR="output_dir/${COUNTRY_CODE}/base/"
else
    LOCALE_DIR="resLocal_$LOCALE"
    OUTPUT_DIR="output_dir/${COUNTRY_CODE}/${LOCALE}/"
fi

mkdir -p "${OUTPUT_DIR}"

if [ -d "$BASE_DIR/$LOCALE_DIR" ]; then
    find "$BASE_DIR/$LOCALE_DIR" -name "Unit_Explanation*.csv" -exec cp {} "$OUTPUT_DIR" \;
    echo "Copied files to $OUTPUT_DIR"
else
    echo "Directory $BASE_DIR/$LOCALE_DIR does not exist."
fi
