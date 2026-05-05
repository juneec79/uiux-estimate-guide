#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: ./push-to-github.sh https://github.com/YOUR_ACCOUNT/uiux-estimate-guide.git"
  exit 1
fi

remote_url="$1"

if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$remote_url"
else
  git remote add origin "$remote_url"
fi

git push -u origin main
