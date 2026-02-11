export AWS_DEFAULT_REGION=ap-northeast-1
export RBENV_VERSION=3.4.1
export EDITOR='nvim'
export REPO_PATH=${HOME}/repo
export TOOLBOX_PATH=${REPO_PATH}/ShoheiKamiya/toolbox
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"
export TF_CLI_ARGS_plan='-parallelism=40'
export TF_CLI_ARGS_apply='-parallelism=40'
$(sed 's/^/export /g' ${HOME}/.env)

export PATH=$(tr "\n" ":" <<PATH
${HOME}/.asdf/shims
${HOME}/.local/bin
/opt/homebrew/bin
/usr/local/bin
/usr/bin
/bin
/usr/sbin
/sbin
${TOOLBOX_PATH}
PATH
)
