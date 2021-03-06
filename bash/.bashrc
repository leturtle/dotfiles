ulimit -n 2048

#alias
alias ll='ls -alFh'
alias e='emacs'
alias b='bundle exec'

#config
export CLICOLOR=1
export LSCOLORS='exfxcxdxbxegedabagacad'
export HISTSIZE=10000
export HISTFILESIZE=10000

#locale
export LANG="en_US.UTF-8"

#home brew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

#python
#export PATH=/usr/local/share/python:$PATH

#php
if which brew > /dev/null && brew list | grep php > /dev/null; then
    export PATH="$(brew --prefix php@7.1)/bin:$PATH"
fi

#java home
export JAVA_HOME=`/usr/libexec/java_home`

#rbenv
export RBENV_ROOT=~/.rbenv

#rbenv bash completion
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#rbenv current ruby version
function parse_rbenv_ruby_version {
    rbenv version 2> /dev/null | sed -e 's/ .*//' -e 's/\(.*\)/\ \(\1\)/'
}


#git bash completion
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
    source `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

#git current branch color
function parse_git_branch_and_add_brackets {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}

#prompt color
export PS1='\[\e[1;32m\]\u\[\e[m\]@\[\e[1;35m\]\h:\[\e[0m\e[1;34m\]\W\[\e[1;33m\]$(parse_rbenv_ruby_version)\[\e[1;31m\]$(parse_git_branch_and_add_brackets)\[\e[m\] $ '
#export PS1='\[\e[1;32m\]\u\[\e[m\]@\[\e[1;35m\]\h\[\e[m\]:\[\e[0m\e[1;34m\]\W\[\e[1;33m\]$(parse_git_branch_and_add_brackets)\[\e[m\] $ '
