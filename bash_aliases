# general
alias la="ls -A"
alias sl="ls"
alias ll="ls -lh"
alias lla="ls -lhA"
alias lls="ls -lhS"
alias llsr="ls -lhSr"
alias lld="ls -lht"
alias lldr="ls -lhtr"
alias h="history"
alias rdp="rdesktop -a 16 -k en-us -u administrator"
alias grep="grep --color=always"
alias md="mkdir -p"
alias e="$EDITOR"
alias lol="echo oh no you didn\'t\!"

if [[ `uname` = "Darwin" ]]; then
  alias listening="netstat -an | grep LISTEN | grep -v STREAM"
  alias ls="ls -G"
  alias flushdns="dscacheutil -flushcache"
  alias ql="qlmanage -p 2> /dev/null"
else
  alias listening="netstat -anp | grep LISTEN | grep -v STREAM"
  alias apt="aptitude"
  eval "`dircolors -b`"
  alias ls="ls --color=auto"
fi

if [[ -x `which htop` ]]; then alias top="htop"; fi

alias bi="bundle install --binstubs=.bin"
alias bx="bundle exec"
# rails
alias sc="script/console"
alias ss="script/server"
alias rc="rails console"
alias rs="rails server"
alias rr="rake routes"
alias rdbm="rake db:migrate"
alias rdbr="rake db:rollback"
alias rdbtp="rake db:test:prepare"
alias rdbmtp="rake db:migrate && rake db:test:prepare"
alias annotate="annotate --position before --show-indexes --exclude tests,fixtures"

# git
alias ga="git add"
alias gst="git status"
alias gp="git push"
alias gpom="git push origin master"
alias gl="git pull"
alias glom="git pull origin master"
alias gf="git fetch"
alias gc="git commit -v"
alias gca="git commit -v -a"
alias gb="git branch"
alias gba="git branch -a"
alias gd="git diff"
alias gh="github"
