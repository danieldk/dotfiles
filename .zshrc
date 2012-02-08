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

export PS1='%n@%m %F{green}%~%f $(git_super_status) %# '

exec 2>>(while read line; do
  print '\e[91m'${(q)line}'\e[0m' > /dev/tty; print -n $'\0'; done &)

source ~/.zsh/git-prompt/zshrc.sh
