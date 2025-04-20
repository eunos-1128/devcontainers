FROM voidlinux/voidlinux:latest

USER root

# 1) /etc/xbps.d を作成し、公式デフォルトではなく repo-default を指定
RUN mkdir -p /etc/xbps.d \
 && printf 'repository=https://repo-default.voidlinux.org/current\n' \
    > /etc/xbps.d/00-repository-main.conf

# 必要パッケージをインストール
RUN xbps-install -Sy xbps && \
    xbps-install -u xbps && \
    xbps-install -y bash sudo shadow \
    && ln -sf /usr/bin/bash /bin/bash

# 以降は bash を使う
SHELL ["/bin/bash", "-lc"]

# (2) useradd のシェルを /bin/bash に変更
RUN if ! getent group vscode; then groupadd --gid 1000 vscode; fi \
    && if ! id -u vscode > /dev/null 2>&1; then \
           useradd --uid 1000 \
                   --gid vscode \
                   --create-home \
                   --shell /bin/bash \
                   vscode; \
       fi \
    && mkdir -p /etc/sudoers.d \
    && echo 'vscode ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/vscode \
    && chmod 0440 /etc/sudoers.d/vscode
