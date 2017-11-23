#!/usr/bin/env sh

PATH="./.homebrew/bin:./node/bin:$PATH"
DIRNAME="$( cd $(dirname "$0"); pwd -P )"

node "${DIRNAME}/foxycli/start.js"
