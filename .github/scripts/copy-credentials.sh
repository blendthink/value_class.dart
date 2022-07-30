#!/usr/bin/env bash

mkdir -p $PUB_CACHE
cat <<EOF > $PUB_CACHE/credentials.json
$PUB_CREDENTIALS
EOF
