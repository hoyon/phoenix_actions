#!/usr/bin/env bash

set -e

echo "::add-matcher::./.github/workflows/linter-matcher.json"
python ./.github/workflows/linter.py


# curl -H "Authorization: token ${GITHUB_TOKEN}" \
#     -H "Accept: application/vnd.github.antiope-preview+json" \
#     -XPOST \
#     --data '@input.json' \
#     "https://api.github.com/repos/${GITHUB_REPOSITORY}/check-runs"
