#!/usr/bin/env bash

python ./.github/workflows/linter.py > input.json

hub api /repos/hoyon/phoenix_actions/check-runs -H Accept:"application/vnd.github.antiope-preview+json" --input=./input.json
