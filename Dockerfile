FROM ubuntu

RUN apt-get update
RUN apt-get install -y binutils nasm

WORKDIR /home

ENTRYPOINT /bin/bash
