#!/bin/bash

SCRIPT_PATH=$(cd $(dirname $0) && pwd)

ln -s -i "${SCRIPT_PATH}"/../nvim ~/.config/nvim

ln -s -i "${SCRIPT_PATH}"/../.Brewfile ~
ln -s -i "${SCRIPT_PATH}"/../.env ~
ln -s -i "${SCRIPT_PATH}"/../.zshrc ~
ln -s -i "${SCRIPT_PATH}"/../.gitconfig ~
