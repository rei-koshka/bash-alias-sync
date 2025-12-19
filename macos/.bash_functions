#!/bin/bash

function git-commit-hours() {
  local hours="$1"

  shift

  local target_date
  target_date=$(date -v "${hours}H" +"%Y-%m-%d %H:%M:%S")

  GIT_AUTHOR_DATE="${target_date}" \
  GIT_COMMITTER_DATE="${target_date}" \
  git commit "$@"
}
