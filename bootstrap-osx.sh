#!/bin/sh

# Expanded save dialog.
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

# Expanded print dialog.
defaults write -g PMPrintingExpandedStateForPrint -bool true

# Disable automatic spelling correction
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Don't write .DS_Store files on network volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable press-and-hold for accented characters.
defaults write -g ApplePressAndHoldEnabled -bool false
