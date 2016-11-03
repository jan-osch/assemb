FROM ubuntu
RUN apt-get update
RUN apt-get install -y binutils
RUN apt-get update
RUN apt-get install -y nasm
RUN apt-get update
RUN apt-get install -y make
RUN apt-get update
RUN apt-get install -y gcc
RUN apt-get update
RUN apt-get install -y libc6-dev-i386
RUN apt-get update
RUN apt-get install -y libc-dev
