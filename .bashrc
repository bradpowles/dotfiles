# Aliases

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Git Completion/Prompt

if [ ! -f ~/.git-completion.bash ]; then
    cd ~
    curl -OL https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
    mv git-completion.bash .git-completion.bash
    curl -OL https://github.com/git/git/raw/master/contrib/completion/git-prompt.sh
    mv git-prompt.sh .git-prompt.sh
fi
source ~/.git-completion.bash
source ~/.git-prompt.sh

# PS1

PS_TIME="\[\e[0;32m\]\t"
PS_HOST="\[\e[0;1;38;5;38m\]\u\[\e[0;38;5;31m\]@\[\e[0;38;5;36m\]\h"
PS_DIR="\[\e[0;35m\][\[\e[0;38;5;37m\]\w\[\e[0;35m\]]"
PS_GIT="\[\e[0;3;35m\]\$(__git_ps1)"
PS_END="\[\e[0;38;5;197m\]\$ \[\e[0m\]$()\[\e[0m\]"


GIT_PS1_SHOWDIRTYSTATE=1
PS1="${PS_TIME} ${PS_HOST} ${PS_DIR}${PS_GIT} ${PS_END}"


