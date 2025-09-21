#!/bin/bash

# set -x

current_branch=$(git branch --show-current)
project_key_file="project-key.txt"
if [[ ! -f "${project_key_file}" ]]; then
    gum input --placeholder "Enter you project key (e.g. \"PROJ\")" >"${project_key_file}"
fi

project_key=$(cat "${project_key_file}")
issue_key=$(echo "${current_branch}" | grep -Eo "${project_key}-\d+")
if [[ -n "${issue_key}" ]]; then
    issue_key_prefix="[${issue_key}] "
fi

type=$(gum choose "feat" "fix" "chore" "refactor" "test" "docs")
summary=$(gum input --value "${issue_key_prefix}${type}: " --placeholder "Summary of this commit")
description=$(gum write --placeholder "(optional) Description of this commit")

git commit -m "${summary}" -m "${description}"
