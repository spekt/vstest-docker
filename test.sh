#!/usr/bin/env bash

#set -o errexit  # exit script if a command fails
set -o nounset  # exit when script uses undeclared vars
set -o pipefail

function _log() {
    printf "... %s\\n" "$*"
}

# Build the assets
dotnet build test/assets.sln

# Build the latest image
_log "Building latest image"
docker image rm spekt/alpine-vstest 2> /dev/null || true
docker build -t spekt/alpine-vstest .

# Create a test container
_log "Creating a test container"
test_container=alpine-vstest-test
docker container kill $test_container 2> /dev/null || true
docker container run -td -w /root/test --rm --name $test_container spekt/alpine-vstest:latest
docker container cp test/ $test_container:/root/

# Run tests in the container
_log "Let's run a few tests"
test_failed=false
docker container exec $test_container ./run.sh || test_failed=true
if [ $test_failed = true ]; then
    _log ".. Test failed!"
fi
docker container rm -f $test_container
_log "Done"

if [ $test_failed = true ]; then
    exit 1
fi
