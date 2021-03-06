FROM gocd/gocd-agent-ubuntu-18.04:v20.2.0

USER root

RUN apt update && apt install -y \
    curl \
  && rm -rf /var/lib/apt/lists/*

# Install docker-compose binary
RUN curl -SL "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-Linux-x86_64" -o "/usr/local/bin/docker-compose"
RUN chmod +x /usr/local/bin/docker-compose

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install -b /usr/local/bin

USER go
