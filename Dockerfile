FROM ubuntu
RUN apt-get update
RUN apt-get install -y binutils
RUN apt-get update
RUN apt-get install -y nasm
RUN apt-get update
RUN apt-get install -y make
RUN apt-get update
RUN apt-get install -y gcc
