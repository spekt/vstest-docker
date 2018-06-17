FROM frolvlad/alpine-mono:latest

MAINTAINER spekt "https://github.com/spekt"

# Install dependencies
RUN apk add --no-cache bash curl grep

# Use cloudflare dns servers to reduce flakiness
RUN echo "nameserver 1.1.1.1" > /etc/resolv.conf

# Install vstest runner
RUN curl -sSL https://raw.githubusercontent.com/spekt/vstest-get/master/install.sh --output /tmp/vstest-install.sh && \
    chmod a+x /tmp/vstest-install.sh && \
    /tmp/vstest-install.sh /usr/lib/vstest

RUN echo "mono /usr/lib/vstest/net451/vstest.console.exe \"\$@\"" > /usr/bin/vstest.console
RUN chmod a+x /usr/bin/vstest.console
