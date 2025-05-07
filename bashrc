#!/usr/bin/env bash

DOTFILES=$(cat "$HOME"/.dotfiles)
GIT_SUPPORT=$(command -v git &> /dev/null)

if $GIT_SUPPORT; then
    if [ ! -f ~/.git-completion.bash ]; then
        cd ~ || exit 1
        curl -OL https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
        mv git-completion.bash .git-completion.bash
        curl -OL https://github.com/git/git/raw/master/contrib/completion/git-prompt.sh
        mv git-prompt.sh .git-prompt.sh
    fi
    # shellcheck source=/dev/null
    source ~/.git-completion.bash
    # shellcheck source=/dev/null
    source ~/.git-prompt.sh
fi

# Imports

for file in $DOTFILES/bash_{aliases,extras,defaults,prompt} ; do
    if [[ -r "$file" ]] && [[ -f "$file" ]] ; then
        # shellcheck source=/dev/null
        source "$file"
    fi
done

