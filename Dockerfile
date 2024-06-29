FROM alpine:latest

RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN apk add --update --no-cache py3-pip py3-setuptools
RUN apk add --update --no-cache ansible curl git openssh sshpass

ENV ANSIBLE_HOST_KEY_CHECKING false

RUN mkdir -p /root/.ssh && chmod 0700 /root/.ssh

COPY ssh-keys/homelab /root/.ssh/id_rsa

RUN chmod 600 /root/.ssh/id_rsa

WORKDIR /work

RUN git clone https://github.com/adelinofaria/homelab-iac-ansible.git

WORKDIR /work/homelab-iac-ansible
