# ====================
# ENV
# ====================
export AWS_DEFAULT_REGION=ap-northeast-1
export RBENV_VERSION=3.2.2
export EDITOR='nvim'
export REPO_PATH=${HOME}/repo
export TOOLBOX_PATH=${REPO_PATH}/ShoheiKamiya/toolbox
$(sed 's/^/export /g' ${HOME}/.env)

# ====================
# Alias
# ====================
alias d="docker"
alias dcom="docker compose"
alias g="git"
alias gg="git grep"
alias pr="gh pr view -w"
alias repo="gh repo view -w"
alias t="terraform"
alias tw="terraform workspace"

# ====================
# Functions
# ====================
function sw() {
  git branch | fzf | xargs git switch
}

function re() {
  repo=$(find ${REPO_PATH} -type d -maxdepth 2 -mindepth 2 | sed s%${REPO_PATH}/%% | fzf)
  [ -z ${repo} ] || cd ${REPO_PATH}/${repo}
}

function replace_command() {
  echo "git grep -l $1 | xargs sed -i '' "s%$1%$2%g""
}

function snippets() {
  BUFFER=$(cat ${HOME}/.snippets | fzf)
  CURSOR=$#BUFFER
}
zle -N snippets
bindkey '^o' snippets

# ====================
# Setup prompt
# ====================
# ref: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
[ ! -e ~/.git-prompt.sh ] && \
  curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

function branch() {
  echo %F{$1}\$vcs_info_msg_0_%f
}

function username() {
  echo "%F{$1}%n%f"
}

function directory() {
  echo "%F{$1}%~%f"
}

PROMPT=$(tr -d "\n" <<PROMPT
%K{black} $(username white) %k
%K{cyan} $(directory black) %k
%K{green} $(branch black) %k 
PROMPT
)

# ====================
# Setup history
# ====================

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

# ====================
# Edit command line
# ====================

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x' edit-command-line

# ====================
# PATH
# ====================
export PATH=$(tr "\n" ":" <<PATH
${HOME}/.rbenv/shims
${HOME}/.rbenv/bin
/opt/homebrew/bin
/usr/local/bin
/usr/bin
/bin
/usr/sbin
/sbin
${TOOLBOX_PATH}
PATH
)

# ====================
# Others
# ====================
autoload -Uz compinit && compinit
setopt no_clobber
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
