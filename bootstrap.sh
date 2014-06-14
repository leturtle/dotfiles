#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"
DOTFILES_ROOT=$(pwd)
BACKUP_DIR="$HOME/.dotfiles.bak"

link_file () {
  local dotfile=$1
  local basename=$(basename "$dotfile")
  if [ -f "$HOME/$basename" ]; then
    if [ -h "$HOME/$basename" ]; then
      rm "$HOME/$basename" 
    else
      backup_file "$basename"
    fi
  fi

  ln -s "$dotfile" "$HOME/$basename"
  echo "link $dotfile to $HOME/$basename"
}

backup_file () {
  local basename=$1

  if [ ! -d "$BACKUP_DIR" ]; then
    mkdir "$BACKUP_DIR"
    echo "create $BACKUP_DIR"
  fi
  
  mv "$HOME/$basename" "$BACKUP_DIR/$basename" 
  echo "backup $HOME/$basename to $BACKUP_DIR"
}

for dotfile in $(find "$DOTFILES_ROOT" -depth 2 -name '.*')
do
  link_file "$dotfile" 
done


