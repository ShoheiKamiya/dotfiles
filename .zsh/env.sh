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
${HOME}/.rbenv/shims
${HOME}/.rbenv/bin
/opt/homebrew/bin
/usr/local/bin
/usr/bin
/bin
/usr/sbin
/sbin
${TOOLBOX_PATH}
/opt/homebrew/opt/postgresql@16/bin
/opt/homebrew/opt/mysql-client@8.0/bin
PATH
)
