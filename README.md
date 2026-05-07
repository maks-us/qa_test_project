# Image Comparison Slider

A beautiful, full-screen image comparison slider built with Flask, featuring an intuitive before/after comparison experience.

## Status

[![CI - Quality Checks](https://github.com/YOUR_USERNAME/qa_test_project/actions/workflows/ci.yml/badge.svg)](https://github.com/YOUR_USERNAME/qa_test_project/actions/workflows/ci.yml)
[![Docker Build](https://github.com/YOUR_USERNAME/qa_test_project/actions/workflows/docker.yml/badge.svg)](https://github.com/YOUR_USERNAME/qa_test_project/actions/workflows/docker.yml)

> **Note:** Update `YOUR_USERNAME` and repository URL in the badges above.

## Features

- 🎨 **Full-Screen Display** - Maximizes image comparison area
- 🖱️ **Smooth Slider** - Drag-and-drop controls with perfect alignment
- 📱 **Responsive Design** - Works on desktop and mobile
- 🔒 **Production Ready** - Type checked, security scanned, and fully tested
- 🐳 **Docker Ready** - Easy deployment with Docker/Docker Compose
- 🚀 **CI/CD Pipeline** - Automated quality checks on every commit

## Quick Start

### Local Development
```bash
# Install dependencies
uv sync

# Run development server
just dev

# Open browser
open http://localhost:5001
```

### Docker
```bash
# Run with Docker Compose
just docker-up

# Open browser
open http://localhost:5001
```

## Quality Assurance

All commits are automatically checked for:
- ✅ Code formatting (Black)
- ✅ Import sorting (isort)
- ✅ Code style (Flake8)
- ✅ Linting (Pylint)
- ✅ Type safety (mypy)
- ✅ Security (Bandit)
- ✅ Unit tests (pytest)
- ✅ Code coverage

### Local Testing
```bash
# Run all checks
just check

# Run specific checks
just test          # Run tests
just type-check    # Type checking
just security      # Security scan
just lint          # Linting and formatting
```

## Project Structure

```
qa_test_project/
├── app.py                      # Flask application
├── justfile                    # Task automation
├── Dockerfile                  # Docker configuration
├── docker-compose.yml          # Docker Compose setup
├── .github/workflows/          # GitHub Actions CI/CD
├── pytest.ini                  # Test configuration
├── pyproject.toml              # Project config
├── .flake8                     # Flake8 config
├── .bandit                     # Security config
├── .pre-commit-config.yaml     # Git hooks config
├── templates/
│   └── index.html              # Main page
├── static/
│   ├── css/style.css
│   ├── js/slider.js
│   └── images/                 # Project images
└── tests/
    └── test_app.py             # Unit tests
```

## Commands

### Using Just (Recommended)
```bash
just dev              # Run development server
just test             # Run unit tests
just lint             # Format and lint code
just check            # Run all quality checks
just docker-up        # Run with Docker
just help             # Show all commands
```

### Manual Commands
```bash
# Development
uv run python app.py

# Testing
uv run pytest

# Code quality
uv run black .
uv run isort .
uv run flake8 app.py
uv run pylint app.py
uv run mypy app.py
uv run bandit -r app.py
```

## Technology Stack

- **Backend**: Flask 3.1+
- **Frontend**: HTML5, CSS3, Vanilla JavaScript
- **Testing**: pytest, pytest-cov
- **Code Quality**: Black, isort, Flake8, Pylint, mypy, Bandit
- **Deployment**: Docker, Docker Compose
- **CI/CD**: GitHub Actions

## License

MIT License - feel free to use this project for any purpose.

## Contributing

1. Create a feature branch
2. Make your changes
3. Ensure all checks pass: `just check`
4. Push and create a Pull Request

All PRs require passing CI checks before merging.
