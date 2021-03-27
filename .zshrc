
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:~/Library/Python/2.7/bin:~/Library/Python/3.7/bin:/Users/ladyred/Code/dotfiles/bin
export PATH=$PATH:~/code/go/bin
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

export GOPATH=~/code/go
export GOBIN=~/code/go/bin

alias 'c'='clear'
alias 'ls'='ls -G'
alias 'cls'='clear & ls'
alias cleanpyc="find . -name \"*.pyc\" -print0 | xargs -0 -n1 rm"

MARKPATH=$HOME/.marks
function jump {
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
    rm -i "$MARKPATH/$1"
}
function marks {
    ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}
export EDITOR='sublime -w'

alias fetch="git fetch upstream && git fetch origin"
alias rebase="fetch && git rebase upstream/master"
alias amirebased='fetch && [ `git rev-parse upstream/master` = `git merge-base HEAD upstream/master` ] && echo yes || echo no'
alias gs='git status'
alias stash='git stash'

alias g="git"

alias pushup="git push -u origin head"
alias githead="git for-each-ref --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))' | head"

alias hunt="pkill  -f"
echo " <***> TERMINAL INITIALIZED <***>"

alias itest="sudo ping -q -c 400 -i 0.005 192.168.42.1"
alias gohome="cd $GOPATH"

# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="/usr/local/opt/openjdk/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ladyred/code/gdmc/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ladyred/code/gdmc/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/ladyred/code/gdmc/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ladyred/code/gdmc/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# export PS1="[\u@\h: \w>] "
export PS1="[%F{8}%D-%*%f %F{red}%n%f]%f%(1j. %B %j Jobs%b.) %F{white}%~ > "
