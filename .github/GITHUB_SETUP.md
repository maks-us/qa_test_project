# GitHub Setup Guide

This document explains how to set up the repository with GitHub Actions CI/CD.

## Prerequisites

- GitHub account with a repository created
- Repository initialized as a git repository locally

## Setup Steps

### 1. Initialize Git (if not already done)
```bash
git init
git add .
git commit -m "Initial commit: Image comparison slider with CI/CD"
```

### 2. Add Remote Repository
```bash
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git branch -M main
git push -u origin main
```

### 3. Create Develop Branch
```bash
git checkout -b develop
git push -u origin develop
```

### 4. Update Badge URLs
Edit `README.md` and replace:
- `YOUR_USERNAME` with your GitHub username
- `qa_test_project` with your repository name

Example:
```markdown
[![CI - Quality Checks](https://github.com/maks/qa_test_project/actions/workflows/ci.yml/badge.svg)](https://github.com/maks/qa_test_project/actions/workflows/ci.yml)
```

### 5. Configure Branch Protection (Optional but Recommended)

Go to **Settings → Branches → Branch protection rules**:

1. Create rule for `main`:
   - Require pull request reviews
   - Require status checks to pass before merging
   - Select all GitHub Actions checks

2. Create rule for `develop`:
   - Require status checks to pass before merging
   - Select all GitHub Actions checks

### 6. Enable Codecov (Optional)

The CI pipeline automatically uploads coverage reports to Codecov:

1. Visit https://codecov.io
2. Sign in with GitHub
3. Add your repository
4. Coverage badges will appear in your README

## What Happens on Every Push/PR

### Automatically Runs:
✅ **Quality Checks Job**
- Black formatting check
- isort import sorting
- Flake8 style check
- Pylint linting
- mypy type checking
- Bandit security scan

✅ **Tests Job**
- pytest unit tests
- Coverage report generation
- Codecov upload

✅ **Docker Job**
- Docker image build
- Smoke test (curl to app)

### Viewing Results

1. Go to your repository on GitHub
2. Click **Actions** tab
3. See workflow runs and their status
4. Click individual workflows to see details

## Local Workflow

Before pushing, run checks locally:

```bash
# Run all checks
just check

# Or individually
just fmt           # Format code
just sort          # Sort imports
just lint          # Lint code
just test          # Run tests
just docker-up     # Test Docker build
```

## Troubleshooting

### CI Workflow Fails

1. **Check logs**: Click on the failed workflow → job → step
2. **Run locally first**: `just check` before pushing
3. **Common issues**:
   - Import errors: run `just sort`
   - Formatting: run `just fmt`
   - Type issues: check `just type-check`
   - Security issues: check `just security`

### Docker Build Fails

- Check `Dockerfile` syntax
- Ensure all files are committed
- Run `docker build -t test .` locally

### Tests Fail

- Run tests locally: `just test`
- Check coverage: `just test-cov`

## Best Practices

1. **Always test locally first**: `just check` before pushing
2. **Create feature branches**: `git checkout -b feature/name`
3. **Use pull requests**: Merge features through PRs, not directly to main
4. **Keep commits clean**: One feature per commit
5. **Write meaningful messages**: "Add feature X" not "fix"

## Protecting Main Branch

Recommended settings in GitHub:

```
Settings → Branches → Add Rule:
- Branch name pattern: main
- Require a pull request before merging: ✓
- Require status checks to pass: ✓
  - ci/quality
  - ci/tests
  - ci/security
  - docker/docker
- Dismiss stale pull request approvals: ✓
- Require branches to be up to date before merging: ✓
```

## Deployment

To enable automatic deployment (future):

1. Add deployment workflow to `.github/workflows/deploy.yml`
2. Configure secrets for deployment credentials
3. Set deployment triggers (e.g., merge to main)

## Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Codecov Documentation](https://docs.codecov.io)
- [Branch Protection Rules](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches)
