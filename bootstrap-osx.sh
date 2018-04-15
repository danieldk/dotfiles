#!/bin/sh

launchctl unload -w /System/Library/LaunchAgents/com.apple.gamed.plist

# Expanded save dialog.
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

# Expanded print dialog.
defaults write -g PMPrintingExpandedStateForPrint -bool true

# Disable automatic spelling correction
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Don't write .DS_Store files on network volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable hyperlink auditing auditing baecon.
# https://github.com/el1t/uBlock-Safari/wiki/Disable-hyperlink-auditing-beacon
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2HyperlinkAuditingEnabled -bool false

brew install z
brew install tmux
brew install reattach-to-user-namespace
