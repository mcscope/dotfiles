export PATH="/usr/local/bin:$HOME/bin:/usr/local/opt/ruby192/bin:/usr/local/share/npm/bin:/usr/local/share/python:/usr/local/share/npm/bin:${PATH}:/Users/Christopher/Code/arcanist/arcanist/bin;"

export PATH=$PATH:/Users/Christopher/torch/install/bin
export LD_LIBRARY_PATH=/Users/Christopher/torch/install/lib:$LD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=/Users/Christopher/torch/install/lib:$DYLD_LIBRARY_PATH



export PS1="\u@\h: \w> "
alias 'c'='clear'
alias 'ls'='ls -G'
alias 'cls'='clear & ls'
# alias 'flush'='echo "FLUSHALL" | redis-cli'  # regular flush
alias startpg='pg_ctl start -D /db/postgres/ &'
alias cleanpyc="find . -name \"*.pyc\" -print0 | xargs -0 -n1 rm"

gf=/usr/local/Cellar/git/1.8.3.4/etc/bash_completion.d/git-completion.bash
[ -f $gf ] && . $gf

export MARKPATH=$HOME/.marks
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
export HISTCONTROL=erasedups
export HISTSIZE=10000
export EDITOR='sublime -w'

ulimit -n 10000  #avert "TOO MANY OPEN FILES"

shopt -s histappend

function screen_title {
  OUT="$*"
  if [ $UID -eq 0 ]; then
    OUT="*$OUT"
  fi
  printf "\033k%s\033\\" "$OUT"
}

function screen_caption {
  OUT="$*"
  printf "\033]0;%s\007" "$OUT"
}

function s {
  screen_title $*
  exec ssh -t $*
}

function st {
  screen_title $*
}


alias fetch="git fetch upstream && git fetch origin"
alias rebase="fetch && git rebase upstream/master"
alias amirebased='fetch && [ `git rev-parse upstream/master` = `git merge-base HEAD upstream/master` ] && echo yes || echo no'
alias gs='git status'
alias stash='git stash'
alias g="git"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
alias pushup="git push -u origin head"
alias wack="ack"
# alias githead="git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:short) - %(authorname)  %09 %09   %(refname:short) ' |head"
alias githead="git for-each-ref --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))' | head"

alias startdb="pg_ctl  -D /mnt/postgres start"
alias hunt="pkill  -f"
alias gut="git"
function check {
    git branch -m "$1" "√_$1"

}
function uncheck {
    git branch -m "√_$1" "$1";
}


  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi


echo "init"

set -o vi
alias ankisoundfix="sudo launchctl unload /System/Library/LaunchDaemons/com.apple.audio.coreaudiod.plist && sudo launchctl load /System/Library/LaunchDaemons/com.apple.audio.coreaudiod.plist"
