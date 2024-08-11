# SPDX-License-Identifier: GPL-3.0-only
# BuildCore
# Build core is a docker container that can be used to build the linux kernel
# and other software. 
#
# Makefile
#
# Copyright (C) 2024 0x4248

DOCKER-ARCH-x86_64 = linux/x86_64
DOCKER-ARCH-arm64 = linux/arm64

# check docker is installed before continuing
ifeq ($(shell docker --version),)
$(error "Docker is not installed")
endif

build-docker:
	@echo "Building docker container for target x86_64"
	@docker build --platform $(DOCKER-ARCH-x86_64) -t buildcore-x86_64 -f Dockerfile .
	@echo "Building docker container for target arm64"
	@docker build --platform $(DOCKER-ARCH-arm64) -t buildcore-arm64 -f Dockerfile .
	@echo "Docker containers built"
	@echo "To run the container use the following command:"
	@echo "docker run -it --rm buildcore-x86_64"