FROM ubuntu:20.04

ENV YAMLLINT_VERSION=1.29.0
ENV PRETTIER_VERSION=2.8.3
ENV GIT_FORMAT_STAGED_VERSION=3.0.0
ENV INSTALL_DIR="/home"

RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get update; \
    apt-get install -y curl \
    python3-pip \
    git


RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -

RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get update; \
    apt-get install -y nodejs

WORKDIR ${INSTALL_DIR}

RUN npm install prettier@${PRETTIER_VERSION} git-format-staged@${GIT_FORMAT_STAGED_VERSION}
RUN pip3 install "yamllint==${YAMLLINT_VERSION}"
ENV PATH="${INSTALL_DIR}/node_modules/.bin:$PATH"
