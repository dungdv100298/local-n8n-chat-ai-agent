# AI Agent Chat Bot with n8n, Ollama, and Postgres

This repository contains a Docker Compose setup for creating an AI Agent Chat Bot workflow using:

- n8n: Workflow automation tool
- Ollama: Local LLM hosting service with llama3.2 model
- Postgres with pgvector: Vector database for storing embeddings

## Getting Started

### Prerequisites

- Docker and Docker Compose installed on your system
- At least 8GB of RAM recommended for running Llama 3.2 model

### Setup and Installation

1. Clone this repository
2. Start the services:

```bash
docker-compose up -d
```

3. The services will be available at:
   - n8n: http://localhost:5678
   - Ollama API: http://localhost:11434
   - Postgres: localhost:5433 (username: n8n, password: n8n)

### Pull the Llama 3.2 Model

After the services are up, you need to pull the Llama 3.2 model for Ollama:

```bash
docker-compose exec ollama ollama pull llama3.2
```

## Building Your Chat Bot Workflow

1. Access n8n at http://localhost:5678
2. Create a new workflow for your chat bot
3. Use the HTTP Request node to interact with Ollama API at http://ollama:11434
4. Store conversation history and embeddings in Postgres using the Postgres node

## Example Ollama API Usage

To generate text with Llama 3.2 model:

```json
POST http://ollama:11434/api/generate
{
  "model": "llama3.2",
  "prompt": "Hello, how can I help you today?",
  "stream": false
}
```

## Notes

- For production use, consider changing the default passwords
- Adjust Docker resource limits as needed for better LLM performance 