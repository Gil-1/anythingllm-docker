#!/bin/bash

# Start Ollama service in the background
ollama serve &

# Wait for Ollama to start
echo "Waiting for Ollama service to start..."
sleep 10

# Pull the Qwen 2.5 model
echo "Pulling models..."
ollama pull llama3:8b-instruct-q5_1
ollama pull llama3.1:8b-instruct-q8_0
ollama pull wen2.5:7b-instruct-q8_0

# Pull the embedding model
echo "Pulling embedding model..."
ollama pull nomic-embed-text

# Keep the container running
echo "Ollama setup complete, keeping container running..."
tail -f /dev/null
