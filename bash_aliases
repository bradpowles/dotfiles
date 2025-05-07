#!/usr/bin/env bash

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias vi='vim'

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias dotf='cd $DOTFILES'
alias dotfu='git -C $DOTFILES pull'

alias root='sudo -Es'
alias sb='source ~/.bashrc'

alias blind-ssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
