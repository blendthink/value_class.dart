#!/usr/bin/env bash

set -e

mkdir -p "$PUB_CACHE"
cat <<EOF > "$PUB_CACHE"/credentials.json
$PUB_CREDENTIALS
EOF
