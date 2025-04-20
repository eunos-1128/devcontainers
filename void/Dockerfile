FROM ghcr.io/void-linux/void-glibc:latest

USER root

RUN mkdir -p /etc/xbps.d && \
    printf 'repository=https://repo-default.voidlinux.org/current\n' \
        > /etc/xbps.d/00-repository-main.conf && \
    printf 'repository=https://repo-default.voidlinux.org/current/nonfree\n' \
        > /etc/xbps.d/10-repository-nonfree.conf

RUN xbps-install -S && \
    xbps-install -u xbps && \
    xbps-install -y git bash sudo shadow
