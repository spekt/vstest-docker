FROM frolvlad/alpine-mono:latest

# Install dependencies
RUN apk add --no-cache bash curl grep

# Install vstest runner
RUN curl -sSL https://raw.githubusercontent.com/spekt/vstest-get/master/install.sh --output /tmp/vstest-install.sh && \
    chmod a+x /tmp/vstest-install.sh && \
    /tmp/vstest-install.sh /usr/lib/vstest

# TODO: install a script to /usr/bin
