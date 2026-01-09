FROM ghcr.io/void-linux/void-glibc-full:latest

# ミラー設定
RUN mkdir -p /etc/xbps.d && \
    echo "repository=https://repo-default.voidlinux.org/current" > /etc/xbps.d/00-repository-main.conf

# システム更新と基本パッケージ
RUN xbps-install -Syu xbps && \
    xbps-install -Syu

# VS Code Server互換性のための重要なパッケージ
# -u フラグで既存パッケージの更新を許可
RUN xbps-install -Syu \
    base-devel \
    bash \
    bash-completion \
    git \
    curl \
    wget \
    xz \
    unzip \
    sudo \
    vim \
    nano \
    ncurses \
    ncurses-term \
    glibc-devel \
    libstdc++ \
    libgcc \
    gcc \
    nodejs \
    python3 \
    gnupg2 \
    libsecret \
    libX11 \
    libxkbfile && \
    xbps-remove -Oy

# VS Code Server用の追加設定
RUN ln -sf /bin/bash /bin/sh

RUN groupadd vscode

# 非rootユーザー作成
RUN useradd -m -s /bin/bash -G vscode vscode && \
    echo "vscode ALL=(root) NOPASSWD:ALL" >> /etc/sudoers.d/vscode && \
    chmod 0440 /etc/sudoers.d/vscode

# ディレクトリ権限設定
RUN mkdir -p /home/vscode/.vscode-server /home/vscode/.vscode-server-insiders && \
    chown -R vscode:vscode /home/vscode

# ワークスペースディレクトリ
WORKDIR /workspace
RUN chown -R vscode:root /workspace

SHELL ["/bin/bash", "-c"]

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TERM=xterm-256color \
    SHELL=/bin/bash
