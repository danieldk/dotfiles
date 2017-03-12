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

# Prompt
#autoload -U promptinit
#promptinit

export PS1='%F{green}%~%f %# '
#export RPS1='$(git_super_status)'

#source ~/.zsh/git-prompt/zshrc.sh
source ~/.zsh/z/z.sh

#export GOROOT=/usr/local/go

export SP_CTYPE=utf8
export SP_CSETLEN=212
export ALPINO_HOME=~/sw/Alpino

# Use JDK 7
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

#~/.zsh/archey/archey -c
