fpath=(/usr/local/share/zsh/site-functions $fpath)

# History options
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zhistory
setopt HIST_SAVE_NO_DUPS
setopt inc_append_history

# Editor
export EDITOR=vim

# Completion
autoload -U compinit
compinit

# vi-style input
bindkey -v
export KEYTIMEOUT=1

bindkey '^R' history-incremental-pattern-search-backward

# Locale
if [ $(uname -s) = "Linux" ] ; then
  export LC_ALL="en_US.UTF-8"
elif [ $(uname -s) = "Darwin" ] ; then
  if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
  fi
fi

# Intel MKL
if [ $(uname -s) = "Linux" -a -x ~/intel/bin/compilervars.sh ] ; then
  source ~/intel/bin/compilervars.sh intel64
fi

# Prompt
#autoload -U promptinit
#promptinit

export PS1='%F{green}%~%f %# '
export RPS1='$(git_super_status)'

source ~/.zsh/git-prompt/zshrc.sh
source ~/.zsh/z/z.sh

#export GOROOT=/usr/local/go
export GOPATH=~/go

export PATH=$PATH:~/go/bin

export SP_CTYPE=utf8
export SP_CSETLEN=212
export ALPINO_HOME=~/sw/Alpino

export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Use JDK 7
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# Commands compiled with Cabal
if [ -d ~/.cabal/bin ]; then
  export PATH=$PATH:~/.cabal/bin
fi

#~/.zsh/archey/archey -c

alias vpn='sudo openconnect -u nnsdd01 https://ras.uni-tuebingen.de'

source $HOME/.cargo/env 2> /dev/null

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
