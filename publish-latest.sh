#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_FILE="$ROOT_DIR/../quote-generator-design-schedule-final.html"

if [ ! -f "$SOURCE_FILE" ]; then
  echo "Source file not found: $SOURCE_FILE"
  exit 1
fi

cp "$SOURCE_FILE" "$ROOT_DIR/index.html"
cp "$SOURCE_FILE" "$ROOT_DIR/quote-generator.html"
cp "$SOURCE_FILE" "$ROOT_DIR/quote-generator-design-schedule-final.html"

cd "$ROOT_DIR"
git add index.html quote-generator.html quote-generator-design-schedule-final.html README.md publish-latest.sh

if git diff --cached --quiet; then
  echo "No changes to publish."
  exit 0
fi

git commit -m "Publish latest quote generator"
git push origin main
