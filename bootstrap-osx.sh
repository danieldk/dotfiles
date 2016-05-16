#!/bin/sh

SUBLIME_PKGDIR=~/Library/Application\ Support/Sublime\ Text\ 2/Packages

launchctl unload -w /System/Library/LaunchAgents/com.apple.gamed.plist

# Expanded save dialog.
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

# Expanded print dialog.
defaults write -g PMPrintingExpandedStateForPrint -bool true

# Disable automatic spelling correction
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Don't write .DS_Store files on network volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
if [ -d "${SUBLIME_PKGDIR}/User" ] ; then
  rm -rf "${SUBLIME_PKGDIR}/User"
else
  mkdir -p "${SUBLIME_PKGDIR}"
fi

ln -s ${PWD}/SublimeText2 "${SUBLIME_PKGDIR}/User"

brew install archey
brew install z
brew install tmux
brew install reattach-to-user-namespace
