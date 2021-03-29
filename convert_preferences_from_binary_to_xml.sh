#!/usr/bin/env zsh


# plutil -convert xml1 Library/Preferences/com.googlecode.iterm2.plist

echo "File: $@"
plutil -convert xml1 "$@"
