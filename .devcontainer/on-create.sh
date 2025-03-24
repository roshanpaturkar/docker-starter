#!/usr/bin/env bash

set -euo pipefail

# Fix /var/run symlink issue (only if needed)
if [ ! -L /var/run ] && [ ! -d /var/run ]; then
  sudo ln -s /run /var/run
else 
  echo "Warning: /var/run already exists!" >&2
fi

# Ensure docker-init.sh exists before running
if [ -f /usr/local/share/docker-init.sh ]; then
  sudo /usr/local/share/docker-init.sh
else
  echo "Error: docker-init.sh not found!" >&2
  exit 1
fi

# Restart Docker to ensure /var/run/docker.sock exists
sudo systemctl restart docker || sudo dockerd &
sleep 5

# Fix Docker socket permissions (only if it exists)
if [ -S /var/run/docker.sock ]; then
  sudo chown ubuntu:docker /var/run/docker.sock
else
  echo "Error: /var/run/docker.sock not found!" >&2
  exit 1
fi
