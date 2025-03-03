#!/bin/bash

# Start Ollama service in the background
ollama serve &

# Wait for Ollama to start
echo "Waiting for Ollama service to start..."
sleep 10

# Pull the models
echo "Pulling models..."
ollama pull llama3:8b-instruct-q5_1
ollama pull llama3.1:8b-instruct-q8_0
ollama pull qwen2.5:7b-instruct-q8_0
# Add additional models as needed
# You can find more models at https://ollama.com/library

# Pull the embedding model
echo "Pulling embedding model..."
ollama pull nomic-embed-text

echo "Ollama setup complete!"
echo "You can run models using: docker exec -it ollama ollama run <model_name>"
echo "Example: docker exec -it ollama ollama run llama3:8b-instruct-q5_1"

# Keep the container running
echo "Keeping container running..."
tail -f /dev/null
