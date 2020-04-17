#!/usr/bin/env bash

set -e

python ./.github/workflows/linter.py > input.json

curl -H "Authorization: token ${GITHUB_TOKEN}" \
    -H "Accept: application/vnd.github.antiope-preview+json" \
    -XPOST \
    --data '@input.json' \
    "https://api.github.com/repos/${GITHUB_REPOSITORY}/check-runs"
