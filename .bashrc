# Jerod Santo's Bash settings

### GENERAL

# set my prompt
function set_prompt() {
local GREEN="\[\033[0;32m\]"
local WHITE="\[\033[1;37m\]"
PS1="\u@\h:\w$GREEN\$(parse_git_branch)$WHITE$ "
export PS1
}
set_prompt

# find out what OS we're on
# OS X will have /Users
# Linux will have /home
if echo $HOME | grep -q Users; then
  os="OSX"
else
  os="Linux"
fi


### ALIASES

alias ll='ls -lh'
alias la='ls -A'
alias sl='ls'

# conditional aliasing
if [ "$os" = "OSX" ]; then
	alias listening='netstat -an | grep LISTEN | grep -v STREAM'
  alias ls='ls -G'
  alias flushdns='dscacheutil -flushcache'
else
	alias listening='netstat -anp | grep LISTEN | grep -v STREAM'
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
fi

# misc
alias rdp='rdesktop -a 16 -k en-us -u administrator'
alias grep='grep --color=always'
alias md='mkdir -p'

if [ -f /usr/bin/htop ];then
        alias top='htop'
fi

#git-specific
alias ga='git add'
alias gst='git status'
alias gp='git push'
alias gl='git pull'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gd='git diff | $EDITOR'


#### ENVIRONMENT SETUP

export PATH="/usr/local/mysql/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:$PATH"
if [ -f /usr/bin/mate ];then
  alias e='mate'
  export EDITOR="mate -w"
elif [ -f /usr/bin/vim ];then
  export EDITOR=vim
  alias vi='vim'
else
  export EDITOR=vi
  alias vim='vi'
fi


### FUNCTIONS

# removes returns for 'grep' on greps of ps output
function pps() { ps aux | grep "$@" | grep -v 'grep'; }

# easy access to find's size search
function findBigfiles() { find "$@" -size +10000k -exec du -h {} \; | sort -nr; }

# add a few shortcut functions to copy/move and change directory at same time
function cpcd() { cp $1 $2 && cd $2; }
function mvcd() { mv $1 $2 && cd $2; }

# this function allows scp'ing a file to remote and then immediately ssh'ing to same remote
function scphh() { scp $1 $2  && ssh `echo $2 | sed ''s/:.*$//''` ; }

# print external IP address
function external_ip() { wget 'http://my-ip.jerodsanto.net' -O - -o /dev/null; }

# count number of files in current directory recursively
function file_count() { find . -type f | wc -l; }

# determine current git branch
function parse_git_branch() {
ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
echo "["${ref#refs/heads/}"]"
}
