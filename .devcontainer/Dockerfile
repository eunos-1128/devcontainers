FROM ghcr.io/void-linux/void-linux:latest-x86_64

RUN xbps-install -Syu && \
    xbps-install -y xbps && \
    xbps-install -y base-minimal bash git curl tar stubby ca-certificates

SHELL ["/bin/bash", "-c"]
