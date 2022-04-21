FROM ubuntu:20.04

ENV YAMLLINT_VERSION=1.26.3
ENV PRETTIER_VERSION=2.6.2
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

RUN npm install prettier@${PRETTIER_VERSION}
RUN pip3 install "yamllint==${YAMLLINT_VERSION}"
ENV PATH="${INSTALL_DIR}/node_modules/.bin:$PATH"
