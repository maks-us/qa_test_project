# QA.md

# Project QA Checklist

## 1. Validate Repository Files
Check that source files are valid and correctly formatted.

Things to verify:
- No broken formatting or collapsed files
- Valid syntax for source code
- Valid YAML/Docker configuration

Example commands:
```bash
docker compose config
python -m py_compile app.py
```

---

## 2. Install Dependencies
Ensure dependencies install successfully.

Things to verify:
- No version conflicts
- No missing packages
- Correct Python/runtime version

Prefer commands from `justfile` when available.

Example:
```bash
just install
```

Fallback:
```bash
pip install -r requirements.txt
```

---

## 3. Run Linters
Run static analysis and formatting checks.

Things to verify:
- No linting errors
- Formatting is consistent
- Type checks pass (if enabled)

Prefer:
```bash
just lint
```

Fallback:
```bash
ruff check .
black --check .
```

---

## 4. Run Tests
Verify automated tests execute successfully.

Things to verify:
- Tests are discoverable
- No syntax/import errors
- Test suite passes

Prefer:
```bash
just test
```

Fallback:
```bash
pytest
```

---

## 5. Validate Docker
Ensure containers build and start correctly.

Things to verify:
- Dockerfile syntax is valid
- Compose configuration works
- Containers start successfully

Commands:
```bash
docker compose config
docker compose build
docker compose up
```

---

## 6. Start the Application
Verify the server starts without runtime errors.

Things to verify:
- Application starts successfully
- No crash during startup
- Correct host/port binding

Prefer:
```bash
just run
```

Fallback:
```bash
python app.py
```

---

## 7. Verify HTTP Response
Check that the running application responds correctly.

Things to verify:
- HTTP status is 200
- Response contains HTML or expected content
- No internal server errors

Example:
```bash
curl -i http://localhost:5000/
```

---

## 8. Verify CI/CD
Ensure CI configuration is valid.

Things to verify:
- Workflow syntax is correct
- Lint and test jobs pass
- Required secrets are configured

---

## Recommended QA Flow

1. Install dependencies
2. Run linters
3. Run tests
4. Validate Docker
5. Start the application
6. Verify HTTP responses
7. Verify CI pipeline
