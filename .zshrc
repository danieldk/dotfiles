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

setopt extended_glob
for zshrc_snippet in ~/.zsh.d/S[0-9][0-9]*[^~] ; do
  source $zshrc_snippet
done
