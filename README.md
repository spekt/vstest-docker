# Docker image for vstest runner

[![Build Status](https://travis-ci.com/spekt/vstest-docker.svg?branch=master)](https://travis-ci.com/spekt/vstest-docker) | [![Docker Pulls](https://img.shields.io/docker/pulls/spekt/alpine-vstest.svg)](https://hub.docker.com/r/spekt/alpine-vstest/) | [![Docker Stars](https://img.shields.io/docker/stars/spekt/alpine-vstest.svg)](https://hub.docker.com/r/spekt/alpine-vstest/)

## Usage instructions
```sh
> docker pull spekt/alpine-vstest
> docker run -it spekt/alpine-vstest bash
bash-4.4# vstest.console /path/to/test.dll
```

If you wish to create your own image, check out [one line installer for vstest][vstest-get]!
[vstest-get]: https://github.com/spekt/vstest-get

# License
MIT
