#!/bin/bash

function gs() {
  if [ -d .git ] || git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    git status
  else
    echo "Not a Git repository."
  fi
}

function rmd() {
    local target="$1"

    # If no argument is provided, use the current directory
    [ -z "$target" ] && target="."

    rm -rf "$target"/{*,.[!.]*,..?*}
}

function cdd ()
{
  if [[ -v DOTFILES_DIR ]]; then
    ENV_EXISTS=true
  else
    ENV_EXISTS=false
  fi

  if [[ ENV_EXISTS = true ]]; then
    if [[ ! -d $DOTFILES_DIR ]]; then
      mkdir "$DOTFILES_DIR"
    fi
  fi

  echo $ENV_EXISTS
}
