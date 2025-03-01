# AnythingLLM with Ollama and ChromaDB

A self-hosted implementation of AnythingLLM using Ollama for LLM and embedding, with ChromaDB as the vector database.

## System Overview

This setup provides:
- **AnythingLLM** - The main application for document processing and chat interface
- **Ollama** - For running local LLM models (currently configured with qwen2.5:7b)
- **ChromaDB** - Vector database for efficient document retrieval
- **Playwright** - For web browsing capabilities

## Prerequisites

- Docker and Docker Compose
- NVIDIA GPU with appropriate drivers (for running LLMs efficiently)
- Minimum 16GB RAM recommended
- 50GB+ storage space for models and data

## Quick Start

1. **Clone this repository**
   ```bash
   git clone <your-repo-url>
   cd <repository-folder>
   ```

2. **Set up environment variables**
   ```bash
   cp .env.example .env
   # Edit .env to add a secure JWT_SECRET
   ```

3. **Start the services**
   ```bash
   docker compose up -d
   ```

4. **Access AnythingLLM**

   Open your browser and navigate to [http://localhost:3001](http://localhost:3001)

5. **Check if models are loaded correctly**
   ```bash
   docker compose logs ollama
   ```

## Current Configuration

### LLM Configuration
- **Provider**: Ollama
- **Model**: qwen2.5:7b
- **Token Limit**: 4096

### Embedding Configuration
- **Provider**: Ollama
- **Model**: nomic-embed-text
- **Chunk Length**: 8192

### Vector Database
- **Provider**: Chroma
- **Endpoint**: http://chroma:8000

### Web Browsing
- **Provider**: Playwright

## File Structure

```
.
├── docker-compose.yml    # Main configuration file
├── scripts/
│   └── init-ollama.sh    # Initializes and loads Ollama models
├── data/                 # Data directories (git-ignored)
│   ├── storage/          # AnythingLLM storage
│   ├── documents/        # Document storage
│   ├── vector-cache/     # Vector cache
│   ├── chroma/           # ChromaDB storage
│   └── ollama/           # Ollama models
└── .env                  # Environment variables
```

## Customization

### Changing Models

To change the Ollama models:

1. Edit the environment variables in `docker-compose.yml`
2. Update the `init-ollama.sh` script to pull the required models
3. Restart the services

```bash
docker compose down
docker compose up -d
```

### Adding More Memory to Ollama

Adjust the `OLLAMA_GPU_OVERHEAD` environment variable in the `ollama` service.

## Troubleshooting

### Common Issues

1. **"No embedding base path was set" error**
   - Ensure `EMBEDDING_BASE_PATH` is correctly set to `http://ollama:11434`

2. **ChromaDB connection errors**
   - Check if the ChromaDB service is running: `docker compose ps`
   - Verify the `CHROMA_ENDPOINT` is set correctly

3. **Models not loading**
   - Check Ollama logs: `docker compose logs ollama`
   - Verify that the models are being pulled correctly

## Maintenance

### Backing Up Data

To back up your data:

```bash
# Stop the services
docker compose down

# Create backup of the data directory
tar -czvf anythingllm-backup-$(date +%Y%m%d).tar.gz ./data

# Restart the services
docker compose up -d
```

### Updating

To update the services:

```bash
# Pull latest images
docker compose pull

# Restart services with new images
docker compose down
docker compose up -d
```

## License

Refer to the respective licenses of:
- [AnythingLLM](https://github.com/mintplex-labs/anythingllm)
- [Ollama](https://github.com/ollama/ollama)
- [ChromaDB](https://github.com/chroma-core/chroma)

---

*This README is a template and should be customized to match your exact implementation details.*
