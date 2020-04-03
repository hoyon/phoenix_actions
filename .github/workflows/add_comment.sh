#!/usr/bin/env bash

# hub api /repos/hoyon/phoenix_actions/issues/1/comments --field body="hello from actions"
hub api /repos/hoyon/phoenix_actions/check-runs -H Accept:"application/vnd.github.antiope-preview+json" --field name="check run" --field head_sha="$GITHUB_SHA"
