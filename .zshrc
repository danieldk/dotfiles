# History options
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zhistory
setopt HIST_SAVE_NO_DUPS
setopt inc_append_history

# Editor
export EDITOR=nvim
alias vi=nvim
alias nv=nvim

# vi-style input
bindkey -v
export KEYTIMEOUT=1

bindkey '^R' history-incremental-pattern-search-backward

if command -v brew &> /dev/null ; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

if [ -d /usr/share/fzf/shell ] ; then
  source /usr/share/fzf/shell/key-bindings.zsh
elif [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
elif [ -d /opt/homebrew/opt/fzf/shell ]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
fi

# Completion
autoload -U compinit
compinit

# Prompt
#autoload -U promptinit
#promptinit

export PS1='%F{green}%~%f %# '
#export RPS1='$(git_super_status)'

#source ~/.zsh/git-prompt/zshrc.sh
source ~/.zsh/z/z.sh

if hash fzf 2> /dev/null ; then
  source ~/.zsh/z/z-fzf.zsh
fi

if which pyenv > /dev/null ; then
  eval "$(pyenv init -)"
fi

if [ -d /opt/homebrew/opt/ccache/libexec ]; then
  export PATH=/opt/homebrew/opt/ccache/libexec:$PATH
fi

if command -v starship &> /dev/null ; then
  eval "$(starship init zsh)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

pyenvdir() {
  if (($# == 1)); then
    VERSION=3.12
  elif (($# == 2)); then
    VERSION=$2
  else
    echo "$0 dir [version]"
    return
  fi

  mkdir "$1"
  cd "$1"
  pyenv virtualenv $VERSION "$1"
  pyenv local "$1"
}

eval "$(/opt/homebrew/bin/mise activate zsh)"
