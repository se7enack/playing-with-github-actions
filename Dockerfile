FROM ubuntu:latest

USER root

RUN apt-get update && \
    apt-get -y install openssh-server vim && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/sshd && \
    rm -f /etc/ssh/ssh_host_*key*

COPY README.md /tmp/

RUN useradd -mr -s /bin/bash user
RUN mkdir -p /home/user/.ssh
RUN chown -R user /home/user
USER user

EXPOSE 22

ENTRYPOINT ["/entrypoint"]
