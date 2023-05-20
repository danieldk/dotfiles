#!/bin/sh

RETURN='\U21a9'
CMD="@"

defaults write com.apple.Terminal NSUserKeyEquivalents "{
    'Enter Full Screen' = '${CMD}${RETURN}';
    'Exit Full Screen' = '${CMD}${RETURN}';
}"

if defaults read com.apple.universalaccess com.apple.custommenu.apps > /dev/null 2>&1; then
    defaults delete com.apple.universalaccess com.apple.custommenu.apps
fi
defaults write com.apple.universalaccess com.apple.custommenu.apps -array

defaults write com.apple.universalaccess com.apple.custommenu.apps "(
    'com.apple.Terminal',
    NSGlobalDomain
)"
