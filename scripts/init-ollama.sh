#!/bin/bash

# Start Ollama service in the background
ollama serve &

# Wait for Ollama to start
echo "Waiting for Ollama service to start..."
sleep 10

# Pull the Qwen 2.5 model
echo "Pulling Qwen 2.5 model..."
ollama pull qwen2.5:7b

# Pull the embedding model
echo "Pulling embedding model..."
ollama pull nomic-embed-text

# Keep the container running
echo "Ollama setup complete, keeping container running..."
tail -f /dev/null
