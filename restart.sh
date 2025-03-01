#!/bin/bash

echo "Stopping existing containers..."
docker compose down

echo "Removing any dangling volumes..."
docker volume prune -f

echo "Starting containers..."
docker compose up -d

echo "Waiting for services to initialize (30 seconds)..."
sleep 30

echo "Checking Ollama container logs..."
docker compose logs ollama

echo "Checking AnythingLLM container logs..."
docker compose logs anythingllm

echo "Testing Ollama API..."
if curl -s http://localhost:11434/api/tags | grep -q "models"; then
    echo "Ollama API is responding correctly"
    echo "Available models:"
    curl -s http://localhost:11434/api/tags
else
    echo "Ollama API response doesn't contain expected data"
fi

echo "Testing Ollama generation API..."
RESPONSE=$(curl -s -X POST http://localhost:11434/api/generate -d '{
    "model": "qwen:2.5-7b-chat-q4_0",
    "prompt": "Hello, how are you?",
    "stream": false
}')
echo "Ollama generation API test response:"
echo "$RESPONSE"

echo "Testing network connectivity between containers..."
docker compose exec anythingllm curl -s http://ollama:11434/api/tags

echo "You can view ongoing logs with: docker compose logs -f"
