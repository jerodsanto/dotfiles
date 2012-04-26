#!/bin/sh
home=${HOME-"~"}
me=${BASH_SOURCE[0]}
dir=$( cd $( dirname $me ) && pwd )
linkables=(*rc bash_aliases gitconfig gitexcludes vim js)

if [[ "$1" == "install" ]]; then
  for link in "${linkables[@]}"; do
    src=$dir/$link
    dest=$home/.$link
    echo "linking $src to $dest"
    ln -s $src $dest
  done
  echo "installing vim plugins"
  vim -u $home/.vim/bundles.vim +BundleInstall +qall
elif [[ "$1" == "uninstall" ]]; then
  for link in "${linkables[@]}"; do
    dest=$home/.$link
    echo "unlinking $dest"
    rm $dest
  done
else
  echo "Usage: $me [install|uninstall]"
fi
