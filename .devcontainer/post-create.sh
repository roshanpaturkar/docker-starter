#!/bin/bash
set -e

echo "Setting up envbuilder..."

# Install envbuilder
if ! command -v envbuilder &> /dev/null; then
  curl -fsSL https://raw.githubusercontent.com/envbuilder/envbuilder/main/install.sh | bash
fi

echo "Setup complete!"
