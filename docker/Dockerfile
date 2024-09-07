FROM ghcr.io/bearfield/debian-fish:bookworm
#
# set env
ENV GOLANG_VERSION=1.23.1
ENV PATH /usr/local/go/bin:$PATH

#
# Install go 1.23.
USER root
SHELL ["/bin/bash", "-c"]
RUN	apt-get update \
    && apt-get install -y --no-install-recommends \
        g++ \
        gcc \
        libc6-dev \
        pkg-config \
    && rm -rf /var/lib/apt/lists/*
RUN curl -o go.tgz https://dl.google.com/go/go$GOLANG_VERSION.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go.tgz \
    && rm go.tgz \
    && go version
ENV GOPATH=/go
ENV PATH $GOPATH/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH
USER kumano_ryo
#
# install gopkgs
RUN go install github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest
#
# install go-outline
RUN go install github.com/ramya-rao-a/go-outline@latest
#
# install gotests
RUN go install github.com/cweill/gotests/gotests@latest
#
# install gomodifytags
RUN go install github.com/fatih/gomodifytags@latest
#
# install impl
RUN go install github.com/josharian/impl@latest
#
# install goplay
RUN go install github.com/haya14busa/goplay/cmd/goplay@latest
#
# install dlv
RUN go install github.com/go-delve/delve/cmd/dlv@latest
#
# install golangci-lint
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin
#RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
#
# install gopls
RUN go install golang.org/x/tools/gopls@latest
#
# install mvdan/gofumpt
RUN go install mvdan.cc/gofumpt@latest
# set env
ENV DEBIAN_FRONTEND=dialog
LABEL org.opencontainers.image.source https://github.com/bearfield/dot-devcontainer-golang-1.23