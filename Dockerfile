FROM node:alpine

ENV YAMLLINT_VERSION=1.38.0
ENV PRETTIER_VERSION=3.9.6
ENV GIT_FORMAT_STAGED_VERSION=4.0.2
ENV INSTALL_DIR="/home"

RUN apk add --no-cache bash python3 py3-pip git \
    && pip3 install --no-cache-dir --break-system-packages "yamllint==${YAMLLINT_VERSION}"

WORKDIR ${INSTALL_DIR}

RUN npm install --no-fund --no-audit \
    prettier@${PRETTIER_VERSION} \
    git-format-staged@${GIT_FORMAT_STAGED_VERSION}

ENV PATH="${INSTALL_DIR}/node_modules/.bin:$PATH"
