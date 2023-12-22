FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential sudo && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS clack
ARG TAGS
RUN addgroup --gid 1000 clack
RUN adduser --gecos  clack --uid 1000 --gid 1000 --disabled-password clack
RUN echo 'clack ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/clack
USER clack
WORKDIR /home/clack

FROM clack
COPY . .
CMD ["sleep", "1d"]
# CMD ["sh", "-c", "ansible-playbook $TAGS local.yml --ask-vault-pass"]
