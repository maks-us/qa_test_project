# Just recipes for qa-test-project

set shell := ["zsh", "-cu"]

# Display all available recipes
@default:
    just --list

# Development
# ===========

# Run the development server
dev:
    uv run python app.py

# Run development server in background
dev-bg:
    uv run python app.py &

# Install dependencies
install:
    uv sync

# Add a new dependency
add dep:
    uv add {{ dep }}

# Add a dev dependency
add-dev dep:
    uv add --dev {{ dep }}

# Testing
# =======

# Run all tests
test:
    uv run pytest

# Run tests with verbose output
test-v:
    uv run pytest -v

# Run specific test
test-one test:
    uv run pytest {{ test }}

# Run tests with coverage
test-cov:
    uv run pytest --cov=. --cov-report=html
    @echo "Coverage report: htmlcov/index.html"

# Code Quality
# ============

# Format code with black
fmt:
    uv run black .

# Check black formatting
fmt-check:
    uv run black --check .

# Sort imports with isort
sort:
    uv run isort .

# Check import sorting
sort-check:
    uv run isort --check-only .

# Lint with flake8
lint-flake:
    uv run flake8 app.py

# Lint with pylint
lint-pylint:
    uv run pylint app.py

# Type check with mypy
type-check:
    uv run mypy app.py

# Security scan with bandit
security:
    uv run bandit -r app.py

# Run all code quality checks
lint: fmt sort lint-flake lint-pylint type-check security
    @echo "✓ All code quality checks passed"

# Check without modifying
lint-check: fmt-check sort-check lint-flake lint-pylint type-check security
    @echo "✓ All code quality checks passed"

# Docker
# ======

# Build Docker image
docker-build:
    docker build -t qa-slider .

# Run with Docker Compose
docker-up:
    docker-compose up --build

# Stop Docker containers
docker-down:
    docker-compose down

# Run Docker image directly
docker-run:
    docker run -p 5001:5001 qa-slider

# CI/CD
# =====

# Run all checks (tests + linting)
check: test lint-check
    @echo "✓ All checks passed"

# Full test suite with coverage
full-test: install test-cov lint-check
    @echo "✓ Full test suite complete"

# Clean up
# ========

# Remove Python cache files
clean:
    find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
    find . -type f -name "*.pyc" -delete
    rm -rf .pytest_cache .coverage htmlcov *.egg-info .venv

# Deep clean (includes dependencies)
clean-all: clean
    rm -rf .venv

# Utils
# =====

# Show Python version
python-version:
    python --version

# Show project structure
tree:
    find . -type f -not -path "./.venv/*" -not -path "./.git/*" -not -path "./.pytest_cache/*" -not -path "./htmlcov/*" | sort

# Open coverage report (macOS)
coverage-open:
    open htmlcov/index.html

# Show help
help:
    @echo "Available commands:"
    @echo ""
    @echo "Development:"
    @echo "  just dev           - Run development server"
    @echo "  just install       - Install dependencies"
    @echo ""
    @echo "Testing:"
    @echo "  just test          - Run all tests"
    @echo "  just test-cov      - Run tests with coverage"
    @echo ""
    @echo "Code Quality:"
    @echo "  just lint          - Run all checks (and fix)"
    @echo "  just lint-check    - Check without fixing"
    @echo "  just fmt           - Format code"
    @echo "  just sort          - Sort imports"
    @echo "  just type-check    - Type checking with mypy"
    @echo "  just security      - Security scan with bandit"
    @echo ""
    @echo "Docker:"
    @echo "  just docker-up     - Run with Docker Compose"
    @echo "  just docker-down   - Stop Docker"
    @echo ""
    @echo "CI/CD:"
    @echo "  just check         - Run tests + linting"
    @echo "  just full-test     - Complete test suite"
