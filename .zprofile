source $HOME/.cargo/env 2> /dev/null

if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -d ~/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

if command -v direnv &> /dev/null ; then
  eval "$(direnv hook zsh)"
fi

if grep -q AuthenticAMD /proc/cpuinfo 2> /dev/null ; then
  export MKL_DEBUG_CPU_TYPE=5
fi
