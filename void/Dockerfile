FROM ghcr.io/void-linux/void-glibc-full:latest

RUN mkdir -p /etc/xbps.d && \
    echo "repository=https://repo-default.voidlinux.org/current" > /etc/xbps.d/00-repository-main.conf

RUN xbps-install -Syu xbps && \
    xbps-install -Syu

RUN xbps-install -Syu \
    base-devel \
    bash \
    zsh \
    bash-completion \
    git \
    curl \
    wget \
    xz \
    unzip \
    sudo \
    helix \
    ncurses \
    ncurses-term \
    glibc-devel \
    libstdc++ \
    libgcc \
    gcc \
    nodejs \
    python3 \
    jupyterlab \
    rust \
    ruby \
    gnupg2 \
    libsecret \
    libX11 \
    libxkbfile && \
    xbps-remove -Oy

RUN ln -sf /bin/bash /bin/sh

RUN useradd -m -s /bin/bash codespace && \
    echo "codespace ALL=(root) NOPASSWD:ALL" >> /etc/sudoers.d/codespace && \
    chmod 0440 /etc/sudoers.d/codespace

RUN mkdir -p /home/vscode/.vscode-server /home/vscode/.vscode-server-insiders && \
    chown -R root:root /home/vscode

WORKDIR /workspaces
RUN chown -R codespace:root /workspaces

SHELL ["/bin/bash", "-c"]

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TERM=xterm-256color \
    SHELL=/bin/bash
