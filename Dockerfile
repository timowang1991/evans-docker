FROM debian:stretch

ARG EVANS_VER

RUN apt-get update && \
    apt-get install -y wget

RUN wget https://github.com/ktr0731/evans/releases/download/${EVANS_VER}/evans_linux_amd64.tar.gz && \
    tar xvf evans_linux_amd64.tar.gz && \
    mv evans /usr/local/bin/ && \
    rm evans_linux_amd64.tar.gz

RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["evans"]
