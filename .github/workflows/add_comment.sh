#!/usr/bin/env bash

# hub api /repos/hoyon/phoenix_actions/issues/1/comments --field body="hello from actions"
pwd
cd .github/workflows || exit

sed -i "s/\__SHA__/$GITHUB_SHA/" ./input.json

hub api /repos/hoyon/phoenix_actions/check-runs -H Accept:"application/vnd.github.antiope-preview+json" --input=./input.json
