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

USER vscode
SHELL ["/usr/bin/bash", "-lc"]
