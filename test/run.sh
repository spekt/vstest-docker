#!/usr/bin/env bash

set -o errexit  # exit script if a command fails
set -o nounset  # exit when script uses undeclared vars
set -o pipefail

function _log() {
    printf "... %s\\n" "$*"
}

# Run mstest tests
_log "## MSTest"
_log ".. Run tests..."
mstest_failed=false
vstest.console mstest-net46/bin/Debug/net46/mstest-net46.dll || mstest_failed=true
if [ $mstest_failed = true ]; then
    _log ".. MSTest tests failed!"
fi
