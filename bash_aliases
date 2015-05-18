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
alias rspec="rspec --color"
alias gti="git"
alias serve="python -m SimpleHTTPServer"
alias screen="tmux"

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

# bundler
alias bi="bundle install --path .bundle/gems --binstubs .bundle/bin"
alias bx="bundle exec"

# rails
alias r="rails"
alias rr="rake routes"
alias rdbm="rake db:migrate"
alias rdbr="rake db:rollback"
alias rdbtp="rake db:test:prepare"
alias rdbmtp="rake db:migrate && rake db:test:prepare"
alias annotate="annotate --position before --show-indexes --exclude tests,fixtures"
