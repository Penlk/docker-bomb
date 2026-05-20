FROM ubuntu:24.04

RUN apt-get update && apt-get upgrade -y

RUN apt update
RUN apt install -y ca-certificates curl
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
RUN chmod a+r /etc/apt/keyrings/docker.asc

RUN tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

RUN apt update

RUN apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

WORKDIR /app

COPY ./  /app/

RUN chmod +x /app/entrypoint.sh

CMD ["bash", "/app/entrypoint.sh"]