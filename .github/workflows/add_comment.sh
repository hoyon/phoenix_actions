#!/usr/bin/env bash

# hub api /repos/hoyon/phoenix_actions/issues/1/comments --field body="hello from actions"
git rev-parse HEAD
cd .github/workflows || exit

echo "$GITHUB_SHA"
echo "$COMMIT_SHA"

sed -i "s/\__SHA__/$COMMIT_SHA/" ./input.json

hub api /repos/hoyon/phoenix_actions/check-runs -H Accept:"application/vnd.github.antiope-preview+json" --input=./input.json
