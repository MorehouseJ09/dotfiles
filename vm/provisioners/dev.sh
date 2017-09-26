#!/usr/bin/env bash

set -e
set -o pipefail
set -u

echo "installing docker compose ..."
mkdir -p /opt/bin
curl -L -s "https://github.com/docker/compose/releases/download/1.14.0/docker-compose-$(uname -s)-$(uname -m)" -o /opt/bin/docker-compose
chmod +x /opt/bin/docker-compose
