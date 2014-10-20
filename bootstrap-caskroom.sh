#!/usr/local/bin

if [ ! -x /usr/local/bin/brew ] ; then
  echo "No homebrew installed!"
  exit 1
fi

 brew install caskroom/cask/brew-cask
 brew tap caskroom/fonts
 brew cask install font-source-code-pro
 brew cask install iterm2
 brew cask install alfred
