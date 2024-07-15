#!/bin/bash

# スクリプトのパス
import_pull_script="/home/keito/git_shell_dummy/import_pull.sh"
export_push_script="/home/keito/git_shell_dummy/export_push.sh"

# Gitリポジトリのリストファイル
git_list="/home/keito/git_list.txt"

# エラーログファイルのパス
error_log="/home/keito/error_log.txt"

# エラーログファイルを初期化
> "$error_log"

# 各スクリプトを実行し、エラーメッセージを収集
while IFS= read -r repo; do
    # リポジトリディレクトリに移動
    if cd "$repo"; then
        import_output=$(sh "$import_pull_script" "$repo" "$1" 2>&1)
        # 特定のエラーメッセージをフィルタリングしてログに記録
        if echo "$import_output" | grep -q -E 'fatal:.*does not match any|remote: error: File .* is .* MB; this exceeds GitHub|error: failed to push some refs to'; then
            if ! echo "$import_output" | grep -q -E 'Everything up-to-date|Already up to date|Your branch is up to date'; then
                echo "Error in $import_pull_script for repo $repo at $(date)" >> "$error_log"
                echo "$import_output" | grep -E 'fatal:.*does not match any|remote: error: File .* is .* MB; this exceeds GitHub|error: failed to push some refs to' >> "$error_log"
                echo -e "\n" >> "$error_log"
            fi
        fi

        export_output=$(sh "$export_push_script" "$repo" "$1" 2>&1)
        # 特定のエラーメッセージをフィルタリングしてログに記録
        if echo "$export_output" | grep -q -E 'fatal:.*does not match any|remote: error: File .* is .* MB; this exceeds GitHub|error: failed to push some refs to'; then
            if ! echo "$export_output" | grep -q -E 'Everything up-to-date|Already up to date|Your branch is up to date'; then
                echo "Error in $export_push_script for repo $repo at $(date)" >> "$error_log"
                echo "$export_output" | grep -E 'fatal:.*does not match any|remote: error: File .* is .* MB; this exceeds GitHub|error: failed to push some refs to' >> "$error_log"
                echo -e "\n" >> "$error_log"
            fi
        fi

        # 元のディレクトリに戻る
        cd - > /dev/null
    else
        echo "Failed to change directory to $repo at $(date)" >> "$error_log"
    fi
done < "$git_list"

# エラーログファイルが空でない場合に通知
if [ -s "$error_log" ]; then
    # wallコマンドで全てのユーザーに通知
    wall < "$error_log"
    # デスクトップ通知
    notify-send "Git Script Notification" "Errors occurred. Check the logs for details."
fi

# 現在の日付を表示
date

