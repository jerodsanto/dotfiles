# Jerod Santo's Bash settings

# find out which OS we're on
# OS X will have /Users
# Linux will have /home
if echo $HOME | grep -q Users; then
  os="OSX"
else
  os="LINUX"
fi

# conditional aliases
if [ "$os" = "OSX" ]; then
  alias listening='netstat -an | grep LISTEN | grep -v STREAM'
  alias ls='ls -G'
  alias flushdns='dscacheutil -flushcache'
else
  alias listening='netstat -anp | grep LISTEN | grep -v STREAM'
  alias apt='aptitude'
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
fi

if [ -f /usr/bin/htop ];then
  alias top='htop'
fi

# unconditional aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

export PATH="/usr/local/mysql/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:$PATH"

# source ruby path separately if exists. for easy Ruby version switching
if [ -f ~/.ruby_path ];then
  export ORIG_PATH=$PATH
  source ~/.ruby_path
fi
# same goes for git path
if [ -f ~/.git_path ];then
  export ORIG_PATH=$PATH
  source ~/.git_path
fi

if [ -f /usr/bin/mate ];then
  export EDITOR="mate -w"
  alias e='mate'
elif [ -f /usr/bin/vim ];then
  export EDITOR=vim
  alias vi='vim'
else
  export EDITOR=vi
  alias vim='vi'
fi

# removes returns for 'grep' on greps of ps output
function pps() { ps aux | grep "$@" | grep -v 'grep'; }

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
function external_ip() { wget 'http://my-ip.heroku.com' -O - -o /dev/null; }

# count number of files in current directory recursively
function file_count() { find . -type f | wc -l; }

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

# cd ... instead of cd ../..
function cd () {
  if [[ $# > 0 ]]; then
    if [ ${1:0:2} == '..' ]; then
      rest=${1:2}
      rest=${rest//./../}
      builtin cd "${1:0:2}/${rest}"
    else
      builtin cd "$1"
    fi
  else
    builtin cd
  fi
}

function set_prompt() {
  local GREEN='\[\033[0;32m\]'
  local WHITE='\[\033[1;37m\]'
  local NULL='\[\033k\033\\\]'
  PS1="$NULL\u@\h:\w$GREEN\$(parse_git_branch)$WHITE$ "
  export PS1
}

set_prompt
