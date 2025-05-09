#!/usr/bin/env bash

DOTFILES=$(cat "$HOME"/.dotfiles)
GIT_SUPPORT=$(command -v git &> /dev/null)

if $GIT_SUPPORT; then
    for git_completion_script in {git-completion.bash,git-prompt.sh} ; do
        if [ ! -f "~/.$git_completion_script" ]; then
            curl -OL "https://github.com/git/git/raw/master/contrib/completion/$git_completion_script" -o "~/.$git_completion_script"
        fi
        # shellcheck source=/dev/null
        source "~/.$git_completion_script"
    done
fi

# Imports

for file in $DOTFILES/bash_{aliases,defaults,functions,prompt} ; do
    if [[ -r "$file" ]] && [[ -f "$file" ]] ; then
        # shellcheck source=/dev/null
        source "$file"
    fi
done

if [[ -r ~/.bash_extras ]] && [[ -f ~/.bash_extras ]] ; then
    # shellcheck source=/dev/null
    source ~/.bash_extras
fi
