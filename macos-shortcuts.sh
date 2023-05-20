#!/bin/sh

RETURN='\U21a9'
CMD="@"

defaults write com.apple.Terminal NSUserKeyEquivalents "{
    'Enter Full Screen' = '${CMD}${RETURN}';
    'Exit Full Screen' = '${CMD}${RETURN}';
}"
