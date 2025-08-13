autoload -Uz vcs_info
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

function set_rprompt() {
  RPROMPT="[${AWS_PROFILE}]"
}

precmd_functions+=( vcs_info )
precmd_functions+=set_rprompt
