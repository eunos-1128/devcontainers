#!/bin/sh
set -e

# runit用ディレクトリ作成とsshdサービスのリンク
mkdir -p /run/runit/runsvdir/current
ln -sf /etc/sv/sshd /run/runit/runsvdir/current/sshd

# sshd_config の自動生成と公開鍵認証の有効化
if [ ! -f /etc/ssh/sshd_config ]; then
  cp /etc/ssh/sshd_config.example /etc/ssh/sshd_config
  sed -i 's/^#\?PasswordAuthentication .*/PasswordAuthentication no/' /etc/ssh/sshd_config
  sed -i 's/^#\?PubkeyAuthentication .*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
  sed -i 's/^#\?PermitRootLogin .*/PermitRootLogin no/' /etc/ssh/sshd_config
fi

# ホスト鍵の自動生成
ssh-keygen -A

# vscodeユーザーのSSH公開鍵を配置（/tmp/authorized_keysが存在する場合のみ）
if [ -f /tmp/authorized_keys ]; then
  mkdir -p /home/vscode/.ssh
  cp /tmp/authorized_keys /home/vscode/.ssh/authorized_keys
  chown -R vscode:vscode /home/vscode/.ssh
  chmod 700 /home/vscode/.ssh
  chmod 600 /home/vscode/.ssh/authorized_keys
fi

exec "$@"
