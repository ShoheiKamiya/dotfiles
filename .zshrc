# OPENSPEC:START
# OpenSpec shell completions configuration
fpath=("${HOME}/.zsh/completions" $fpath)
autoload -Uz compinit
compinit
# OPENSPEC:END

setopt no_clobber

bindkey -v # キーマップがリセットされるのでキーマップの設定はこの後に行う

. ${HOME}/.zsh/env.sh
. ${HOME}/.zsh/aliases.sh
. ${HOME}/.zsh/functions.sh
. ${HOME}/.zsh/prompt.sh
. ${HOME}/.zsh/history.sh

zle -N snippets && bindkey '^o' snippets
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^g' edit-command-line
autoload -Uz compinit && compinit
