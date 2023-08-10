FROM ubuntu:latest

USER root

RUN apt-get update && \
    apt-get -y install nmap

RUN useradd -mr -s /bin/bash user

RUN mkdir -p /home/user/.ssh

COPY .github/workflows/main.yml /home/user/

RUN chown -R user /home/user

USER user

RUN cat /home/user/main.yml

# EXPOSE 22

# ENTRYPOINT ["/entrypoint"]
