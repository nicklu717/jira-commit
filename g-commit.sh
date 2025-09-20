#!/bin/bash

# set -x

type=$(gum choose "feat" "fix" "chore" "refactor" "test" "docs")
summary=$(gum input --value "${type}: " --placeholder "Summary of this commit")
description=$(gum write --placeholder "(optional) Description of this commit")
echo "[SUMMARY] ${summary}"
echo "[DESCRIPTION] ${description}"
