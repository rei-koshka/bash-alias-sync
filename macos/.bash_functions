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

function nosleep() {
  sudo pmset -a disablesleep 1 || return 1

  trap 'sudo pmset -a disablesleep 0; trap - EXIT INT TERM' EXIT INT TERM

  echo
  echo "No sleep until interrupt"
  echo

  caffeinate -dsu
}
