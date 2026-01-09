FROM ghcr.io/void-linux/void-linux:latest-x86_64-glibc

RUN xbps-install -Syu xbps && \
    xbps-install -Syu && \
    xbps-install -y \
        base-devel \
        bash \
        git \
        curl \
        wget \
        tar \
        ca-certificates \
        procps-ng \
        sudo \
        vim

# 作業ディレクトリの設定
WORKDIR /workspace

SHELL ["/bin/bash", "-c"]
