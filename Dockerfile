FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=nonintaractive

RUN apt-get update -y && apt-get upgrade -y


ARG USER_NAME
ARG USER_UID
ARG USER_GID

RUN apt install -y sudo \
  zsh \
  nano \
  less \
  man-db \
  manpages \
  manpages-dev \
  coreutils \
  procps \
  psmisc \
  iproute2 \
  iputils-ping \
  net-tools \
  curl \
  wget \
  rsync \
  sshfs \
  unzip \
  zip \
  tar \
  file \
  lsof \
  btop \
  tree \
  jq \
  build-essential \
  gcc \
  g++ \
  make \
  cmake \
  clang \
  python3 \
  python3-pip \
  python3-venv \
  python3-dev \
  python-is-python3 \
  ripgrep \
  fd-find \
  stow \
  tmux \
  fzf \
  locales \
  tini \
  command-not-found \
  ca-certificates \
  git


RUN groupadd -g ${USER_GID} ${USER_NAME}

RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN /usr/sbin/useradd -g ${USER_UID} -m -G sudo,${USER_NAME} -s /bin/bash ${USER_NAME}
RUN echo "${USER_NAME} ALL=(ALL:ALL) NOPASSWD: ALL" > "/etc/sudoers.d/${USER_NAME}"
RUN chmod 0440 /etc/sudoers.d/${USER_NAME}

COPY --chown=${USER_NAME}:${USER_NAME} . /home/${USER_NAME}

USER ${USER_NAME}
WORKDIR /home/${USER_NAME}

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN /home/linuxbrew/.linuxbrew/bin/brew bundle --file Brewfile

USER root
WORKDIR /

RUN apt install tini


ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["sleep", "infinity"]

