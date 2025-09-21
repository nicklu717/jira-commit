#!/bin/bash

# set -x

current_branch=$(git branch --show-current)
issue_key=$(echo "${current_branch}" | grep -Eo "PROJ-\d+")
if [[ -n "${issue_key}" ]]; then
    issue_key_prefix="[${issue_key}] "
fi

type=$(gum choose "feat" "fix" "chore" "refactor" "test" "docs")
summary=$(gum input --value "${issue_key_prefix}${type}: " --placeholder "Summary of this commit")
description=$(gum write --placeholder "(optional) Description of this commit")

git commit -m "${summary}" -m "${description}"
