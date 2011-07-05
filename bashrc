# Jerod Santo's Bash settings

# have a big history and share it across bashes
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export PATH="/usr/local/mysql/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# rvm ftw, but it must be sourced before functions or it will override my "cd"
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm"
elif [[ -s "/usr/local/rvm/scripts/rvm" ]]; then
  source "/usr/local/rvm/scripts/rvm"
fi

# removes returns for "grep" on greps of ps output
function pps() { ps aux | grep "$@" | grep -v "grep"; }

# easy access to find's size search
function find_big_files() { find "${1-.}" -size +10000k -exec du -h {} \; | sort -nr; }

# managing broken symlinks
function find_broken_symlinks() { find -x -L "${1-.}" -type l; }
function rm_broken_symlinks() { find -x -L "${1-.}" -type l -exec rm {} +; }

# add a few shortcut functions to copy/move and change directory at same time
function cpcd() { cp $1 $2 && cd $2; }
function mvcd() { mv $1 $2 && cd $2; }

# allows scp'ing a file to remote and then immediately ssh'ing to same remote
function scphh() { scp $1 $2  && ssh `echo $2 | sed ''s/:.*$//''` ; }

# print external IP address
function external_ip() { wget "http://my-ip.heroku.com" -O - -o /dev/null; }

# count number of files in current directory recursively
function file_count() { find . -type f | wc -l; }

# open man pages in textmate
function mman() { man "$@" | col -bx | mate; }

# determine current git branch
function parse_git_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "["${ref#refs/heads/}"]"
}

# quick access to domain availability check
function domain_available() {
  if whois $1 | grep "No match for" >&/dev/null; then
    echo "$1 is available";
    return 0;
  else
    echo "$1 is not available";
    return 1;
  fi
}

function cd () {
  # cd ... instead of cd ../..
  if [[ $# > 0 ]]; then
    if [ ${1:0:2} == ".." ]; then
      rest=${1:2}
      rest=${rest//./../}
      builtin cd "${1:0:2}/${rest}"
    else
      builtin cd "$1"
    fi
  else
    builtin cd "$@"
  fi
  # do that rvm thang
  if type rvm &>/dev/null; then
    local result=$?
    __rvm_project_rvmrc
    __rvm_after_cd
    ls
    return $result
  else
    ls
  fi
}

# allow for preset screen sessions
function screen() {
  super=`which screen`
  if [ "$1" == "rails" ]; then
    $super -S `basename $PWD` -c $HOME/.screenrailsrc
  else
    $super $@
  fi
}

function set_prompt() {
  local GREEN='\[\033[0;32m\]'
  local WHITE='\[\033[1;37m\]'
  local NULL='\[\033k\033\\\]'
  PS1="$NULL\u@\h:\w$GREEN\$(parse_git_branch)$WHITE$ "
  export PS1
}

function todo() { if [ $# == "0" ]; then cat $TODO; else echo "• $@" >> $TODO; fi }
function todone() { sed -i -e "/$*/d" $TODO; }

set_prompt

if type brew &>/dev/null; then source `brew --prefix`/etc/bash_completion; fi
if [[ -s "$HOME/.bash_aliases" ]]; then source "$HOME/.bash_aliases"; fi
# certain machines need some local settings that I don't want to store here
if [[ -s "$HOME/.bash_local" ]]; then source "$HOME/.bash_local"; fi
