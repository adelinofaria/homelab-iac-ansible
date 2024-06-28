FROM alpine:latest

RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN apk add --update --no-cache py3-pip py3-setuptools py3-lxc
RUN apk add --update --no-cache ansible sshpass

RUN apk add curl git

WORKDIR /work

RUN git clone https://github.com/adelinofaria/homelab-iac-ansible.git

WORKDIR /work/homelab-iac-ansible
