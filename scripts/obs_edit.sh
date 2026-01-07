#!/usr/bin/env bash
#set -e

SRC="$(realpath "$1")"
BASENAME="$(basename "$SRC")"

VAULT="$HOMIE/Obsidian Notes/BIORAM"
TMP="$VAULT/tmp"
LINK="$TMP/$BASENAME"

mkdir -p "$TMP"

cleanup() {
  echo
  echo "Cleaning up symlink"
  rm -f "$LINK"
  exit 130
}

# Ensure cleanup runs even on Ctrl-C
trap cleanup INT TERM

# Create / overwrite symlink
ln -sf "$SRC" "$LINK"

open "obsidian://open?vault=BIORAM&file=tmp/$BASENAME"

echo "Editing $SRC via symlink"
echo "Press ENTER when done"
read

rm -f "$LINK"
