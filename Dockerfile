FROM ubuntu:25.10

USER root

WORKDIR /root

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl git make sudo

# Install VSCode CLI
RUN curl -Lk "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64" -o vscode_cli.tar.gz

# Unpack VSCode CLI tools
RUN tar -xf vscode_cli.tar.gz && \
    rm vscode_cli.tar.gz

# Move code binary to /usr/local/bin
RUN mv code /usr/local/bin/code

# Change ubuntu user password to 'ubuntu'
RUN echo "ubuntu:ubuntu" | chpasswd

USER ubuntu

WORKDIR /home/ubuntu

# Entry point to start VSCode tunnel
# name of the tunnel can be specified via environment variable TUNNEL_NAME
ENTRYPOINT /usr/local/bin/code tunnel --name "${TUNNEL_NAME}" --accept-server-license-terms