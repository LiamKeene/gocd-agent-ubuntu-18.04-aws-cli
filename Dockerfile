FROM gocd/gocd-agent-ubuntu-18.04:v20.2.0

USER root

RUN apt update && \
  apt upgrade -y
RUN apt install -y curl
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install -b /usr/local/bin
RUN ["aws", "--version"]

USER go

