#!/bin/sh

# 引数として受け取ったディレクトリに移動
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

# Gitの操作を行い、結果を変数に格納
git add -A
git commit --allow-empty-message -m "" > /dev/null 2>&1
git push origin "$branch"
status=$?

## 失敗した場合にのみ通知
#if [ $status -ne 0 ]; then
#    # エラーメッセージを取得
#    error_message=$(git push origin "$branch" 2>&1)
#    message="Git push failed on branch $branch at $(date). Error details:\n$error_message"
#    # wallコマンドで全てのユーザーに通知
#    echo -e "$message" | wall
#    notify-send "Git Push Notification" "$message"
#fi

# 元のディレクトリに戻る
cd - || exit

# 現在の日付を表示
date

