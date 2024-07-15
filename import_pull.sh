#!/bin/sh

# 指定されたディレクトリに移動
cd "$1" || exit

# 現在のブランチ名を取得
branch=$(git symbolic-ref --short -q HEAD)

# ブランチ名が取得できなかった場合、エラーメッセージを表示して終了
if [ -z "$branch" ]; then
    echo "Failed to determine the current branch."
    echo "Make sure you are in a valid git repository."
    cd - || exit
    date
    exit 1
fi

# git pull を実行し、結果を変数に格納
pull_output=$(git pull origin "$branch" -f 2>&1)
status=$?

## 失敗した場合にのみ通知
#if [ $status -ne 0 ]; then
#    message="Git pull failed on branch $branch at $(date). Error details:\n$pull_output"
#    # wallコマンドで全てのユーザーに通知
#    echo -e "$message" | wall
#    notify-send "Git Pull Notification" "$message"
#fi

# 元のディレクトリに戻る
cd - || exit

# 現在の日付を表示
date

