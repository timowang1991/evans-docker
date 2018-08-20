FROM debian:stretch
LABEL maintainer saboyutaka<yutaka.paradigm.shift@gmail.com>

RUN apt-get update && \
    apt-get install -y wget

RUN wget https://github.com/ktr0731/evans/releases/download/0.5.2/evans_linux_amd64.tar.gz && \
    tar xvf evans_linux_amd64.tar.gz && \
    mv evans /usr/local/bin/ && \
    rm evans_linux_amd64.tar.gz

RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["evans"]
