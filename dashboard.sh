#!/bin/bash

function main(){
  client="$(pwd | sed 's/.*clients\///g' | sed 's/\/.*//g')"
  search="$(awk -F: '/run/&& NR>5{print $2}' "$0" | fzf )"
  cmd="$(awk -v s="$search" '$0~s {getline; print $2}' "$0" | cut -d\( -f1 )"
  $cmd
  exit 0
}

# run:Git Stage
function git_stage() {
  echo "Staging files"
}

# run:Git Reset
function git_reset() {
    echo "Reseting files..."
}

# run:Downsync Live
function downsync_live(){
  echo "Getting live db..."
}

# run:Downsync Staging
function downsync_live(){
  echo "Getting live db..."
}

# run:Backup
function backup() {
    echo "Starting database backup..."
}

# run:Commit
function commit() {
    echo "Starting SVN commit..."
}

# run:Deploy Live
function deploy_live() {
    echo "Starting deploy to live..."
}

# run:Deploy Staging
function deploy_staging() {
    echo "Starting deploy to staging..."
}

main
