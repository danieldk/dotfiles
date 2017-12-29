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

if [ -d /usr/share/fzf ] ; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
elif [ -d /usr/local/opt/fzf ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

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

#export GOROOT=/usr/local/go

export SP_CTYPE=utf8
export SP_CSETLEN=212
export ALPINO_HOME=~/sw/Alpino

# Use JDK 7
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

#~/.zsh/archey/archey -c
