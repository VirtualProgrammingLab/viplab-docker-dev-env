FROM alpine/git AS backend

ARG GITHUB_TOKEN
ARG GIT_BACKEND_REPO=backend
ARG GIT_BACKEND_BRANCH=sles12

RUN set -eux; \
    git clone https://${GITHUB_TOKEN}@github.tik.uni-stuttgart.de/viplab/${GIT_BACKEND_REPO}.git /backend; \
    cd /backend; \
    git checkout ${GIT_BACKEND_BRANCH}; \
    rm -Rf .git

FROM debian as builder

RUN set -eux; \
    apt-get update; \
    apt-get install -y \
        build-essential \
        cmake \
        gcc \
        #gcc-4.8 \
        #g++-4.8 \
        #libssl-dev \
        libcurl4-openssl-dev \
        octave \
        sudo \
        unzip \
        curl \
        git \
    ; \
    rm -rf /var/lib/apt/lists/*

WORKDIR /Backend

COPY --from=backend /backend/Backend /Backend

RUN make install

FROM debian

RUN set -eux; \
    apt-get update; \
    apt-get install -y \
        gcc \
        gcc-c++ \
        octave-cli \
        java-1_8_0-openjdk-devel \
        gnuplot \
        viplab \
        matlab\
    ; \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder  /Backend /opt/viplab/Backend
WORKDIR /opt/viplab/Backend

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
