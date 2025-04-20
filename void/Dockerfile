FROM ghcr.io/void-linux/void-glibc-full:latest

USER root

RUN mkdir -p /etc/xbps.d && \
    printf 'repository=https://repo-default.voidlinux.org/current\n' \
        > /etc/xbps.d/00-repository-main.conf && \
    printf 'repository=https://repo-default.voidlinux.org/current/nonfree\n' \
        > /etc/xbps.d/10-repository-nonfree.conf

RUN xbps-install -S && \
    xbps-install -u xbps && \
    xbps-install -y git bash sudo shadow openssh && \
    xbps-remove -O

RUN id -u vscode 2>/dev/null || useradd -m -s /bin/bash vscode && \
    echo "vscode ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vscode && \
    chmod 0440 /etc/sudoers.d/vscode

COPY setup_sshd.sh /tmp/setup_sshd.sh
RUN chmod +x /tmp/setup_sshd.sh

ENTRYPOINT ["/tmp/setup_sshd.sh"]
CMD ["runsvdir", "-P", "/run/runit/runsvdir/current"]
