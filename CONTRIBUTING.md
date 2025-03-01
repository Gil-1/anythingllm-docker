# Contributing to AnythingLLM Docker Setup

Thank you for your interest in contributing to this AnythingLLM Docker setup! This document outlines the process for contributing to this project.

## Getting Started

1. **Fork the repository** to your own GitHub account
2. **Clone your fork** to your local machine
3. **Create a new branch** for your feature or bugfix

## Development Workflow

### 1. Set up the Environment

Make sure you have Docker and Docker Compose installed on your system.

### 2. Make Your Changes

Common areas for contribution include:

- Improving documentation
- Adding support for new LLM models
- Enhancing the Docker Compose configuration
- Creating helpful scripts
- Fixing bugs

### 3. Testing Your Changes

Before submitting a pull request, please test your changes:

```bash
# Start the services with your changes
docker compose up -d

# Test the functionality you've changed
# Document any new behavior
```

### 4. Submitting a Pull Request

1. **Push your changes** to your fork
2. **Create a pull request** against the main repository
3. **Describe your changes** in detail
   - What problem does it solve?
   - How does it work?
   - How was it tested?

## Coding Guidelines

- Keep the Docker Compose file clean and well-commented
- Document environment variables in .env.example
- Follow shell scripting best practices in any scripts
- Keep the README.md up-to-date with your changes

## Branching Strategy

- `main` branch is for stable releases
- Create feature branches from `main` named `feature/your-feature-name`
- Create bugfix branches from `main` named `fix/bug-description`

## Communication

- For major changes, please open an issue first to discuss what you would like to change
- Feel free to ask questions if something isn't clear

Thank you for contributing to make this project better!
