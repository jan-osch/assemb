FROM ubuntu

RUN apt-get update
RUN apt-get install -y binutils nasm

VOLUME ["/home"]
WORKDIR /home

ENTRYPOINT /bin/bash
