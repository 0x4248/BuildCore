# BuildCore
Build core is a docker container that can be used to build the linux kernel and other software.

## Why?

Some software is difficult to build on a host machine (e.g. your running on macos and want to build a linux kernel). It also allows for containerized builds which prevents the host machine from being polluted with build dependencies.

## How to use

First build the container:

```bash
make
```

Then run the container:

```bash
docker run -it --rm -v .:/volume -w /volume buildcore-x86_64
```

There is also an arm64 version:

```bash
docker run -it --rm -v .:/volume -w /volume buildcore-arm64
```