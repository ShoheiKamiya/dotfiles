#!/bin/bash

SCRIPT_PATH=$(cd $(dirname $0) && pwd)

ln -s -i "${SCRIPT_PATH}"/../.config/iterm2/com.googlecode.iterm2.plist ~/.config/iterm2
ln -s -i "${SCRIPT_PATH}"/../.config/nvim ~/.config
ln -s -i "${SCRIPT_PATH}"/../.config/git ~/.config
ln -s -i "${SCRIPT_PATH}"/../.Brewfile ~
ln -s -i "${SCRIPT_PATH}"/../Gemfile ~
ln -s -i "${SCRIPT_PATH}"/../.env ~
ln -s -i "${SCRIPT_PATH}"/../.snippets ~
ln -s -i "${SCRIPT_PATH}"/../.zshrc ~
ln -s -i "${SCRIPT_PATH}"/../.zsh ~
ln -s -i "${SCRIPT_PATH}"/../.claude/settings.json ~/.claude/
ln -s -i "${SCRIPT_PATH}"/../.claude/CLAUDE.md ~/.claude/
