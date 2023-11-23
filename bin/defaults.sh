#!/bin/bash

defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain com.apple.trackpad.scaling -int 3
defaults write com.apple.finder AppleShowAllFiles 'YES'
defaults write com.apple.menuextra.clock DateFormat 'EEE d MMM HH:mm'
defaults write com.apple.menuextra.battery ShowPercent 'YES'

mkdir -p ~/Pictures/screencaptures
defaults write com.apple.screencapture location ~/Pictures/screencaptures

read -n1 -p "These settings will be relfected after reboot. Do you want to reboot? (y/N) >" yn
if [[ $yn = [yY] ]]; then
  sudo shutdown -r now
else
  echo -e "\n Rebooting is aborted"
fi
