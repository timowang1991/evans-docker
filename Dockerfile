FROM debian:stretch

ENV EVANS_VER $(curl --silent "https://api.github.com/repos/ktr0731/evans/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y curl

RUN wget https://github.com/ktr0731/evans/releases/download/${EVANS_VER}/evans_linux_amd64.tar.gz && \
    tar xvf evans_linux_amd64.tar.gz && \
    mv evans /usr/local/bin/ && \
    rm evans_linux_amd64.tar.gz

RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["evans"]
