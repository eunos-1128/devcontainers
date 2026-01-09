FROM ghcr.io/void-linux/void-glibc-full:latest

# デバッグ情報を出力
RUN echo "=== Void Linux Container Build Started ===" && \
    cat /etc/os-release && \
    echo "=== Setting up mirror ===" && \
    mkdir -p /etc/xbps. d && \
    echo "repository=https://repo-default.voidlinux.org/current" > /etc/xbps. d/00-repository-main. conf && \
    echo "=== Updating xbps ===" && \
    xbps-install -Syu xbps && \
    echo "=== Full system update ===" && \
    xbps-install -Syu && \
    echo "=== Installing packages ===" && \
    xbps-install -y \
        base-devel \
        bash \
        git \
        curl \
        wget \
        tar \
        gzip \
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
        coreutils && \
    echo "=== Cleaning up ===" && \
    xbps-remove -Oy && \
    echo "=== Creating vscode user ===" && \
    useradd -m -s /bin/bash vscode && \
    echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    echo "=== Build Complete ==="

WORKDIR /workspace
SHELL ["/bin/bash", "-c"]
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TERM=xterm-256color
