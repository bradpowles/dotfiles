#!/usr/bin/env bash

git-origin-ssh() {
  current_url=$(git remote get-url origin)

  if [[ $current_url =~ https?://([^/]+)/(.*) ]]; then
    host="${BASH_REMATCH[1]}"
    repo_path="${BASH_REMATCH[2]}"
    ssh_url="git@$host:$repo_path"
    git remote set-url origin "$ssh_url"
    echo "Changed origin to SSH: $ssh_url"
  else
    echo "Origin is not an HTTP(S) URL or is already using SSH."
  fi
}

