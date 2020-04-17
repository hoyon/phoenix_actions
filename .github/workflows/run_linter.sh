#!/usr/bin/env bash

set -e

echo "::add-matcher::.github/workflows/linter-matcher.json"
python ./.github/workflows/linter.py
