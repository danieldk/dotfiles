# Locale
if [ $(uname -s) = "Linux" ] ; then
  export LC_ALL="en_US.UTF-8"
elif [ $(uname -s) = "Darwin" ] ; then
  if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
  fi
fi

# Intel MKL
if [ $(uname -s) = "Linux" -a -x ~/intel/bin/compilervars.sh ] ; then
    source ~/intel/bin/compilervars.sh intel64
fi

export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

source $HOME/.cargo/env 2> /dev/null

eval "$(/usr/local/bin/rbenv init -)"

export GOPATH=~/go

export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
