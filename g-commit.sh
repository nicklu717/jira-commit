#!/bin/bash

# set -x

current_branch=$(git branch --show-current)
issue_key=$(echo "${current_branch}" | grep -Eo "PROJ-\d+")

type=$(gum choose "feat" "fix" "chore" "refactor" "test" "docs")
summary=$(gum input --value "[${issue_key}] ${type}: " --placeholder "Summary of this commit")
description=$(gum write --placeholder "(optional) Description of this commit")
echo "[SUMMARY] ${summary}"
echo "[DESCRIPTION] ${description}"
