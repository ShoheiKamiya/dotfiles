setopt histfindnodups
setopt histsavenodups
setopt histignorealldups
setopt sharehistory
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=10000
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history
