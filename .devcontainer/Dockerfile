FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install envbuilder
RUN curl -fsSL https://raw.githubusercontent.com/envbuilder/envbuilder/main/install.sh | bash

# Set up Docker-in-Docker
RUN apt-get update && apt-get install -y docker.io
