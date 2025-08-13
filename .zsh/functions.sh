function sw() {
  git branch | fzf | xargs git switch
}

function re() {
  repo=$(find ${REPO_PATH} -type d -maxdepth 2 -mindepth 2 | sort | sed s%${REPO_PATH}/%% | fzf)
  [ -z ${repo} ] || cd ${REPO_PATH}/${repo}
}

function replace_command() {
  echo "git grep -l $1 | xargs sed -i '' "s%$1%$2%g""
}

function snippets() {
  BUFFER=$(cat ${HOME}/.snippets | fzf)
  CURSOR=$#BUFFER
}

function aws_profile() {
  PROFILE=$(cat ${HOME}/.aws/myaccounts.json | jq -r '.[] | [.accountName, .accountId] | join(" | ")' | fzf | cut -d " " -f 1)
  export AWS_PROFILE=${PROFILE}
  echo switched to ${AWS_PROFILE}
}
