#!/bin/bash

set -e

docker pull mergermarket/docz-site-builder

function reset_cursor {
    echo -n -e '\e[?0c'
}
trap reset_cursor EXIT

docker run \
    --init -it \
    --rm \
    -v $PWD/docs/doczrc.js:/app/doczrc.js \
    -v $PWD/docs/src:/app/src \
    -p 3000:3000 \
    mergermarket/docz-site-builder \
    docz dev
