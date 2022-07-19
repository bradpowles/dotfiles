if [ ! -f ~/.git-completion.bash ]; then
    cd ~
    curl -OL https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
    mv git-completion.bash .git-completion.bash
    curl -OL https://github.com/git/git/raw/master/contrib/completion/git-prompt.sh
    mv git-prompt.sh .git-prompt.sh
fi
source ~/.git-completion.bash
source ~/.git-prompt.sh


# Imports

for file in ~/.bash_{aliases,prompt} ; do
    if [[ -r "$file" ]] && [[ -f "$file" ]] ; then
        source "$file"
    fi
done


