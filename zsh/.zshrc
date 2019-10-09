ulimit -n 2048

#alias
alias ll='ls -alFh'
alias em='emacs'

#config
export CLICOLOR=1
export LSCOLORS='exfxcxdxbxegedabagacad'
export HISTSIZE=10000
export HISTFILESIZE=10000

#locale
export LANG="en_US.UTF-8"

#home brew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

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

#git current branch color
function parse_git_branch_and_add_brackets {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}

#prompt color
setopt PROMPT_SUBST
export PS1='%F{green}%B%n%f%b'@'%F{magenta}%B%m%f%b':'%F{blue}%B%~%f%b''%F{red}%B$(parse_git_branch_and_add_brackets)%f%b'$'\n''%F{white}%B>%f%b '

#completion
autoload -U compinit
compinit
