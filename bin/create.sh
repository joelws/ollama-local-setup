#!/bin/bash

podman volume create ollama-data
podman volume create open-webui

podman pod create \
  --security-opt label=disable \
  -p 5454:5000 \
  -p 8909:8080 \
  -p 11434:11434 \
  ollama-local

podman run \
  --pod ollama-local \
  -d \
  --security-opt=label=disable \
  --name ollama \
  --device nvidia.com/gpu=all \
  -v ollama-data:/data \
  -e OLLAMA_BASE_URL=http://olama:11434 \
  ollama/ollama:latest

podman run \
  --pod ollama-local \
  -d \
  --name open-webui \
  -v open-webui:/app/backend/data \
  ghcr.io/open-webui/open-webui:main
