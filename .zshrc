# History options
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zhistory
setopt inc_append_history

# Completion
autoload -U compinit
compinit

# Prompt
#autoload -U promptinit
#promptinit

if [[ $(hostname) = *.rug.nl ]] ; then
  alias volker="ssh -Y volker.let.rug.nl"
  alias vingolf="ssh -Y vingolf.let.rug.nl"
fi

export PS1='%n@%m %F{green}%~%f $(git_super_status) %# '

source ~/.zsh/git-prompt/zshrc.sh
