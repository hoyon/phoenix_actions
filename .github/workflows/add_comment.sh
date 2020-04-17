#!/usr/bin/env bash

python ./.github/workflows/linter.py > input.json

curl -H "Authorization: token ${API_TOKEN}" \
    -H "Accept: application/vnd.github.antiope-preview+json" \
    -XPOST \
    --data '@input.json' \
    "https://api.github.com/repos/${GITHUB_REPOSITORY}/check-runs"
