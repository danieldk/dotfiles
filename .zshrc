# History options
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zhistory
setopt HIST_SAVE_NO_DUPS
setopt inc_append_history

# Editor
export EDITOR=emacs

# Completion
autoload -U compinit
compinit

# vi-style input
bindkey -v
export KEYTIMEOUT=1

bindkey '^R' history-incremental-pattern-search-backward

if [ -d /usr/share/fzf/shell ] ; then
  source /usr/share/fzf/shell/key-bindings.zsh
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
