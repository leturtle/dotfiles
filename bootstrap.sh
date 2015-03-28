#!/usr/bin/env bash

BACKUP_DIR=$HOME/.dotfiles.bak

cd $(dirname BASH_SOURCE)


link_file () {
    local dotfile=$1
    local linkfile=$2

    if [ -f $linkfile ]; then
        if [ -h $linkfile ]; then
            echo remove link $linkfile
            rm $linkfile
        else
            backup_file $linkfile
        fi
    fi

    echo link $dotfile to $linkfile
    ln -s $dotfile $linkfile
}

link_dir () {
    local dotdir=$1
    local linkdir=$HOME/$(basename $dotdir)
    if [ ! -d $linkdir ]; then
        echo create dir $linkdir
        mkdir $linkdir
    fi
    for dotfile in $(ls -A $dotdir)
    do
        link_file $dotdir/$dotfile $HOME/$(basename $dotdir)/$dotfile
    done
}

backup_file () {
    local file=$1

    if [ ! -d $BACKUP_DIR ]; then
        echo create $BACKUP_DIR
        mkdir $BACKUP_DIR
    fi

    echo backup $file to $BACKUP_DIR
    mv $file $BACKUP_DIR
}

for dotfile in $(find $(pwd) -depth 2 -name ".*")
do
    if [ -d $dotfile ]; then
        link_dir $dotfile
    else
        link_file $dotfile $HOME/$(basename $dotfile)
    fi
done

if [[ $1 && ( $1 == "init") ]]; then
for initscript in $(find $(pwd) -depth 2 -name "init.*")
do
    /usr/bin/env osascript "$initscript"
done
fi
