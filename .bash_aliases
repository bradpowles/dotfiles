alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias dotf='cd $(dirname $(readlink -f ~/.bashrc))'
alias dotfu='git -C $(dirname $(readlink -f ~/.bashrc)) pull'

alias root='sudo -Es'
alias sb='source ~/.bashrc'
