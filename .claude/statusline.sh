#!/bin/bash
# Claude Code ステータスライン
# 表示項目: 作業ディレクトリ / モデル名 / コンテキスト残量 / 5h・7d レート制限残量
# 割合はすべて「残量（あと何%使えるか）」で統一表示する
# stdin で statusLine 用 JSON を受け取る

input=$(cat)

DIR=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // "?"')
DIR_NAME=$(basename "$DIR")
# git ブランチ（リポジトリ外なら空 → 非表示）
BRANCH=$(git -C "$DIR" rev-parse --abbrev-ref HEAD 2>/dev/null)
MODEL=$(echo "$input" | jq -r '.model.display_name // "?"')
CTX=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
# レート制限は Pro/Max ユーザーかつ API 呼び出し後のみ届く（無ければ empty）
FIVE_USED=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
SEVEN_USED=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

# ANSI カラー
CYAN='\033[36m'
BLUE='\033[34m'
MAGENTA='\033[35m'
GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'
DIM='\033[2m'
RESET='\033[0m'

# 残量に応じた色（少ないほど警告）
remain_color() {
  if [ "$1" -lt 20 ]; then printf '%b' "$RED"
  elif [ "$1" -lt 50 ]; then printf '%b' "$YELLOW"
  else printf '%b' "$GREEN"; fi
}

SEP="${DIM} | ${RESET}"

# 作業ディレクトリ（常時表示）
printf "${BLUE}%s${RESET}" "$DIR_NAME"

# git ブランチ（リポジトリ内のみ）
if [ -n "$BRANCH" ]; then
  printf "${SEP}${MAGENTA}\xe2\x8e\x87 %s${RESET}" "$BRANCH"
fi

# モデル + コンテキスト残量（常時表示）
CTX_REMAIN=$(awk "BEGIN{printf \"%d\", 100 - $CTX}")
printf "${SEP}${CYAN}%s${RESET}${SEP}$(remain_color "$CTX_REMAIN")ctx %s%%${RESET}" \
  "$MODEL" "$CTX_REMAIN"

# 5h レート制限残量（届いた場合のみ）
if [ -n "$FIVE_USED" ]; then
  FIVE_REMAIN=$(awk "BEGIN{printf \"%d\", 100 - $FIVE_USED}")
  printf "${SEP}$(remain_color "$FIVE_REMAIN")5h %s%%${RESET}" "$FIVE_REMAIN"
fi

# 7d レート制限残量（届いた場合のみ）
if [ -n "$SEVEN_USED" ]; then
  SEVEN_REMAIN=$(awk "BEGIN{printf \"%d\", 100 - $SEVEN_USED}")
  printf "${SEP}$(remain_color "$SEVEN_REMAIN")7d %s%%${RESET}" "$SEVEN_REMAIN"
fi
