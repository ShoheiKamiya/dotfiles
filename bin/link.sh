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
[ -e ~/.claude/settings.json ] || cp "${SCRIPT_PATH}"/../.claude/settings.json ~/.claude/
ln -s -i "${SCRIPT_PATH}"/../.claude/CLAUDE.md ~/.claude/
ln -s -i "${SCRIPT_PATH}"/../.claude/statusline.sh ~/.claude/
# iTerm2 の cc-status は同じディレクトリの it2 を呼ぶため、両方リンクする
ln -s -i /Applications/iTerm.app/Contents/Resources/utilities/cc-status ~/.config/iterm2/
ln -s -i /Applications/iTerm.app/Contents/Resources/utilities/it2 ~/.config/iterm2/
