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

# Prompt
#autoload -U promptinit
#promptinit

if [[ $(hostname) = *.rug.nl ]] ; then
  alias volker="ssh -Y volker.let.rug.nl"
  alias vingolf="ssh -Y vingolf.let.rug.nl"
else
  alias bastion="ssh -Y bastion"
  alias volker="ssh -Y volker"
  alias vingolf="ssh -Y vingolf"
fi

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

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# Use JDK 7
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# Commands compiled with Cabal
if [ -d ~/.cabal/bin ]; then
  export PATH=$PATH:~/.cabal/bin
fi

~/.zsh/archey/archey -c

# Task warrior
zstyle ':completion:*:*:task:*' verbose yes
zstyle ':completion:*:*:task:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:*:task:*' group-name ''
alias t=task
compdef _task t=task
