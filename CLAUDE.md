# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project: Image Comparison Slider

A simple Python web application that displays two images with an interactive vertical slider for image comparison (before/after style).

**Tech Stack**: Flask, HTML5, CSS3, Vanilla JavaScript

## Architecture

### Backend
- **app.py**: Flask application serving the HTML template and static assets
- **templates/**: Jinja2 HTML templates
- **static/**: CSS and JavaScript assets

### Frontend
The slider component allows users to compare two images by dragging a vertical divider:
- **Fully right**: Only first image visible
- **Fully left**: Only second image visible  
- **In between**: First image on left, second image on right, separated by the slider

Uses vanilla JavaScript (no dependencies) for mouse drag interactions and smooth image visibility transitions.

## Quick Start with Just

The easiest way to run common tasks is with [Just](https://github.com/casey/just):

```bash
# View all available commands
just

# Run development server
just dev

# Run tests
just test

# Run all checks (tests + linting)
just check

# Format and lint code
just lint

# Run with Docker
just docker-up
```

## Getting Started

### Local Development
```bash
uv sync
uv run python app.py
```

Navigate to `http://localhost:5001` in your browser.

### Docker

**Build and run with Docker Compose:**
```bash
docker-compose up --build
```

Access at `http://localhost:5001`

**Or use Docker directly:**
```bash
docker build -t qa-slider .
docker run -p 5001:5001 qa-slider
```

### Development
- **Run dev server**: `uv run python app.py`
- **Add dependencies**: `uv add <package_name>`
- **Edit templates**: `templates/index.html`
- **Edit styles/scripts**: `static/css/style.css`, `static/js/slider.js`
- **Image configuration**: Update image paths in the template as needed

### Testing

**Run tests:**
```bash
# Run all tests
uv run pytest

# Run specific test file
uv run pytest tests/test_app.py

# Run specific test
uv run pytest tests/test_app.py::TestApp::test_index_route_returns_200

# Run with verbose output
uv run pytest -v

# Run with coverage report
uv run pytest --cov=. --cov-report=html

# Watch mode (auto-run on file changes)
uv run pytest-watch
```

**Test structure:**
- `tests/` - Contains all test files
- `tests/test_app.py` - Tests for Flask routes and functionality
- Coverage reports in `htmlcov/index.html`

### Code Quality

**Linting and formatting:**
```bash
# Format code with black
uv run black .

# Sort imports with isort
uv run isort .

# Check code style with flake8
uv run flake8 app.py

# Lint with pylint
uv run pylint app.py

# Run all checks
uv run black . && uv run isort . && uv run flake8 app.py && uv run pylint app.py
```

**Pre-commit hooks:**
```bash
# Install pre-commit
pip install pre-commit

# Set up git hooks
pre-commit install

# Run manually
pre-commit run --all-files
```

### Project Structure
```
qa_test_project/
├── app.py                      # Flask application
├── justfile                    # Task automation
├── Dockerfile                  # Docker configuration
├── docker-compose.yml          # Docker Compose setup
├── pytest.ini                  # Pytest configuration
├── .flake8                     # Flake8 configuration
├── .pre-commit-config.yaml     # Pre-commit hooks
├── pyproject.toml              # Project config + linter settings
├── templates/
│   └── index.html              # Main page with slider
├── static/
│   ├── css/
│   │   └── style.css
│   ├── js/
│   │   └── slider.js
│   └── images/
│       ├── park.png
│       └── matrix.png
└── tests/
    ├── __init__.py
    └── test_app.py             # Unit tests
```

## Available Commands

### Using Just (Recommended)
```bash
just dev              # Run development server
just test             # Run tests
just lint             # Format and lint code
just check            # Run all checks
just docker-up        # Run with Docker
just help             # Show all commands
```

### Manual Commands
See the sections below for direct uv, pytest, and docker commands.
