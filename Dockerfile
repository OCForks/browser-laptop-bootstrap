FROM node:8

RUN apt-get update && apt-get install -y \
  bison \
  build-essential \
  curl \
  g++-multilib \
  gcc-multilib \
  git \
  gperf \
  libgnome-keyring-dev \
  libnotify-dev \
  libssl-dev \
  ninja-build \
  python-pip \
  sudo

RUN npm install -g node-gyp@3.3.1
RUN pip install Jinja2==2.8.1

RUN curl -sSf https://static.rust-lang.org/rustup.sh | sh
RUN cargo install sccache
ENV PATH="/root/.cargo/bin:${PATH}"
RUN echo "sccache = /root/.cargo/bin/sccache" > /root/.npmrc
