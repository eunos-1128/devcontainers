FROM ghcr.io/void-linux/void-glibc-full:latest

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

WORKDIR /workspace

SHELL ["/bin/bash", "-c"]
