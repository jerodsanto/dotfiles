alias d="docker"
alias e="$EDITOR"
alias g="git"
alias h="history"
alias r="rails"

alias la="ls -A"
alias sl="ls"
alias ll="ls -lh"
alias lla="ls -lhA"
alias lls="ls -lhS"
alias llsr="ls -lhSr"
alias lld="ls -lht"
alias lldr="ls -lhtr"

alias rdp="rdesktop -a 16 -k en-us -u administrator"
alias grep="grep --color=always"
alias md="mkdir -p"
alias rspec="rspec --color"
alias gti="git"
alias serve="python3 -m http.server"
alias screen="tmux"
alias mux="tmuxinator"
alias chrome="open -a Google\ Chrome"

alias rr="rake routes"
alias rdbm="rake db:migrate"
alias rdbmtp="rake db:migrate && rake db:test:prepare"

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
