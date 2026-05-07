FROM python:3.10-slim

WORKDIR /app

COPY pyproject.toml uv.lock ./

RUN pip install uv && uv sync --no-dev

COPY app.py .
COPY templates/ templates/
COPY static/ static/

EXPOSE 5001

CMD ["uv", "run", "python", "app.py"]
