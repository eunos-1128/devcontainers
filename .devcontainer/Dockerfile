FROM ghcr.io/void-linux/void-glibc-full:latest

# ミラー設定
RUN mkdir -p /etc/xbps. d && \
    echo "repository=https://repo-default.voidlinux.org/current" > /etc/xbps.d/00-repository-main.conf && \
    echo "repository=https://repo-default.voidlinux.org/current/musl" > /etc/xbps.d/01-repository-multilib.conf

# システム更新と基本パッケージ
RUN xbps-install -Syu xbps && \
    xbps-install -Syu

# VS Code Server互換性のための重要なパッケージ
RUN xbps-install -y \
    base-devel \
    bash \
    bash-completion \
    git \
    curl \
    wget \
    tar \
    gzip \
    bzip2 \
    xz \
    unzip \
    ca-certificates \
    openssl \
    procps-ng \
    sudo \
    vim \
    nano \
    ncurses \
    ncurses-term \
    shadow \
    which \
    findutils \
    coreutils \
    util-linux \
    glibc \
    glibc-devel \
    libstdc++ \
    libgcc \
    gcc \
    nodejs \
    python3 \
    gnupg2 \
    libsecret \
    krb5 \
    krb5-libs \
    libX11 \
    libxkbfile \
    libsecret && \
    xbps-remove -Oy

# VS Code Server用の追加設定
RUN ln -sf /bin/bash /bin/sh

# 非rootユーザー作成
RUN useradd -m -s /bin/bash -G wheel vscode && \
    echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/vscode && \
    chmod 0440 /etc/sudoers.d/vscode

# ディレクトリ権限設定
RUN mkdir -p /home/vscode/.vscode-server /home/vscode/.vscode-server-insiders && \
    chown -R vscode:vscode /home/vscode

# ワークスペースディレクトリ
WORKDIR /workspace
RUN chown -R vscode:vscode /workspace

SHELL ["/bin/bash", "-c"]

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TERM=xterm-256color \
    SHELL=/bin/bash
