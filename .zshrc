# History options
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zhistory
setopt inc_append_history

# Completion
autoload -U compinit
compinit

# vi-style input
bindkey -v

bindkey '^R' history-incremental-pattern-search-backward

# Locale
if [ $(uname -s) = "Linux" ] ; then
  export LC_ALL="en_US.UTF-8"
elif [ $(uname -s) = "Darwin" ] ; then
  export PATH="$PATH:/usr/local/bin:/usr/texbin"
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

export PS1='%n@%m %F{green}%~%f $(git_super_status) %# '

source ~/.zsh/git-prompt/zshrc.sh

export GOPATH=~/go

export PATH=$PATH:~/go/bin

export SP_CTYPE=utf8
export SP_CSETLEN=212
export ALPINO_HOME=~/sw/Alpino

export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
