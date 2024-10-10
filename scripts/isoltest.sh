#!/usr/bin/env bash

set -e

REPO_ROOT="$(dirname "$0")"/..
exec "${REPO_ROOT}/build/test/tools/isoltest" --no-semantic-tests --testpath "${REPO_ROOT}/test"

