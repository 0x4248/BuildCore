# SPDX-License-Identifier: GPL-3.0-only
# BuildCore
# Build core is a docker container that can be used to build the linux kernel
# and other software. 
#
# Dockerfile
#
# Copyright (C) 2024 0x4248

FROM debian:latest

# First we need to update the system
RUN apt-get update

# Install the necessary packages for building many software
RUN apt-get install -y \
    fakeroot \
    build-essential \
    ncurses-dev \
    libncurses5-dev \
    xz-utils \
    libssl-dev \
    bc \
    flex \
    libelf-dev \
    bison \
    cpio \
    python3 \
    python3-pip \
    cmake \
    ninja-build

# Handy tools just in case that you need them
RUN apt-get install -y git fish vim nano curl wget neovim

# Why are we creating symlinks for python?
# Because some scripts use python instead of python3 for some reason and it can
# be a pain to fix them all so we can fix with a simple symlink to python3. You
# also might ask why not update .bashrc? Well, If a script uses sh instead of bash
# then it will not work. So, we are creating symlinks for python and pip.
RUN ln -s /usr/bin/python3 /usr/bin/python

WORKDIR /root 

CMD ["/bin/fish"]