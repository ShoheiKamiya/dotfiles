setopt no_clobber

. ${HOME}/.zsh/env.sh
. ${HOME}/.zsh/aliases.sh
. ${HOME}/.zsh/functions.sh
. ${HOME}/.zsh/prompt.sh
. ${HOME}/.zsh/history.sh

zle -N snippets && bindkey '^o' snippets

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x' edit-command-line
bindkey -v

autoload -Uz compinit && compinit
