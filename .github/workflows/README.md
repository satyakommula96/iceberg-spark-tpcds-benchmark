# GitHub Workflows Documentation

This directory contains GitHub Actions workflows for the Iceberg Spark TPC-DS Benchmark project.

## Workflows Overview

### 1. CI Build and Test (`ci.yml`)
**Trigger:** Push and Pull Request to main/master/develop branches

**Purpose:** Continuous integration for building and testing the project

**Jobs:**
- Builds with Maven across Java 8 and Java 11
- Runs unit tests
- Performs Scalastyle checks
- Uploads build artifacts and test results

**Status Badge:**
```markdown
[![CI Build and Test](https://github.com/YOUR_ORG/iceberg-spark-tpcds-benchmark/actions/workflows/ci.yml/badge.svg)](https://github.com/YOUR_ORG/iceberg-spark-tpcds-benchmark/actions/workflows/ci.yml)
```

---

### 2. Release (`release.yml`)
**Trigger:** 
- Push tags matching `v*.*.*` pattern (e.g., v0.1.0)
- Manual workflow dispatch with version input

**Purpose:** Automated release process

**Jobs:**
- Builds release packages
- Creates tar.gz and zip archives
- Generates SHA256 checksums
- Creates GitHub release with artifacts
- Includes release notes and documentation

**Creating a Release:**
```bash
# Create and push a tag
git tag -a v0.1.0 -m "Release version 0.1.0"
git push origin v0.1.0

# Or trigger manually from GitHub Actions UI
```

---

### 3. Code Quality (`code-quality.yml`)
**Trigger:** 
- Push and Pull Request to main/master/develop branches
- Weekly schedule (Sundays at midnight UTC)

**Purpose:** Code quality checks and analysis

**Jobs:**
- **Scalastyle Check:** Validates Scala code style
- **Dependency Check:** Analyzes dependencies and security
- **License Check:** Verifies Apache license headers
- **Documentation Build:** Generates Scaladoc
- **Code Metrics:** Counts lines of code and reports statistics

---

### 4. Integration Tests (`integration-tests.yml`)
**Trigger:** 
- Push and Pull Request to main/master branches
- Daily schedule (2 AM UTC)

**Purpose:** End-to-end integration testing

**Jobs:**
- **Local FileSystem Test:** Tests data generation on local filesystem
- **Docker MinIO Test:** Tests S3 integration using MinIO service
  - Validates S3A filesystem compatibility
  - Tests Iceberg table creation in S3
  - Verifies data integrity

---

### 5. Dependency Updates (`dependency-updates.yml`)
**Trigger:** 
- Weekly schedule (Mondays at midnight UTC)
- Manual workflow dispatch

**Purpose:** Automated dependency update checks

**Jobs:**
- Checks for Maven dependency updates
- Checks for Maven plugin updates
- Creates GitHub issues for available updates
- Uploads dependency reports

---

### 6. Performance Benchmarks (`benchmarks.yml`)
**Trigger:** 
- Push and Pull Request to main/master branches
- Manual workflow dispatch with configurable scale factor

**Purpose:** Performance benchmarking

**Jobs:**
- Benchmarks Parquet data generation
- Benchmarks Iceberg data generation
- Measures execution time and data sizes
- Comments results on Pull Requests
- Stores benchmark history

**Running Manual Benchmarks:**
```bash
# Go to Actions tab → Performance Benchmarks → Run workflow
# Specify scale factor (default: 1)
```

---

## Required Secrets

No secrets are required for basic workflows. However, for advanced features:

### Optional Secrets:
- `GITHUB_TOKEN` - Automatically provided by GitHub Actions
- `AWS_ACCESS_KEY_ID` - For real S3 testing (optional, MinIO used in CI)
- `AWS_SECRET_ACCESS_KEY` - For real S3 testing (optional)

---

## Workflow Configuration

### Caching Strategy
All workflows use caching for:
- Maven repository (`~/.m2/repository`)
- Scala compiler (`build/scala-*`)

This significantly reduces build times.

### Matrix Strategy
The CI workflow uses matrix builds to test across:
- Java 8 (primary)
- Java 11 (compatibility)

### Artifact Retention
- Build artifacts: 7 days
- Test results: 7 days
- Benchmark results: 90 days
- Release packages: 30 days
- Code metrics: 30 days

---

## Badge Collection

Add these badges to your main README.md:

```markdown
## Build Status

[![CI Build and Test](https://github.com/YOUR_ORG/iceberg-spark-tpcds-benchmark/actions/workflows/ci.yml/badge.svg)](https://github.com/YOUR_ORG/iceberg-spark-tpcds-benchmark/actions/workflows/ci.yml)
[![Code Quality](https://github.com/YOUR_ORG/iceberg-spark-tpcds-benchmark/actions/workflows/code-quality.yml/badge.svg)](https://github.com/YOUR_ORG/iceberg-spark-tpcds-benchmark/actions/workflows/code-quality.yml)
[![Integration Tests](https://github.com/YOUR_ORG/iceberg-spark-tpcds-benchmark/actions/workflows/integration-tests.yml/badge.svg)](https://github.com/YOUR_ORG/iceberg-spark-tpcds-benchmark/actions/workflows/integration-tests.yml)
[![Performance Benchmarks](https://github.com/YOUR_ORG/iceberg-spark-tpcds-benchmark/actions/workflows/benchmarks.yml/badge.svg)](https://github.com/YOUR_ORG/iceberg-spark-tpcds-benchmark/actions/workflows/benchmarks.yml)
```

---

## Customization

### Modifying Spark Version
Update the `SPARK_VERSION` variable in integration test workflows:
```yaml
SPARK_VERSION=3.5.1  # Change to your version
```

### Adjusting Schedule
Modify the `cron` expressions:
```yaml
schedule:
  - cron: '0 0 * * 0'  # Change schedule as needed
```

### Changing Java Versions
Update the matrix in `ci.yml`:
```yaml
matrix:
  java: [8, 11, 17]  # Add more versions
```

---

## Troubleshooting

### Workflow Failures

**Build Failures:**
- Check Maven cache is valid
- Verify Java version compatibility
- Review build logs in Actions tab

**Integration Test Failures:**
- Ensure Spark download URL is accessible
- Check MinIO service health
- Verify filesystem permissions

**Release Failures:**
- Confirm tag format matches `v*.*.*`
- Check pom.xml version update
- Verify GITHUB_TOKEN permissions

### Local Testing

Test workflows locally using [act](https://github.com/nektos/act):
```bash
# Install act
brew install act  # macOS
# or
curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash

# Run CI workflow locally
act -j build-and-test

# Run specific workflow
act -W .github/workflows/ci.yml
```

---

## Workflow Maintenance

### Regular Tasks
1. **Monthly:** Review and update dependency versions
2. **Quarterly:** Update Spark version compatibility
3. **Bi-annually:** Review and optimize caching strategies
4. **Yearly:** Update GitHub Actions versions

### Monitoring
- Check workflow run times in Actions tab
- Monitor artifact storage usage
- Review failed workflow patterns
- Track benchmark trends

---

## Contributing

When adding new workflows:
1. Follow naming convention: `kebab-case.yml`
2. Include descriptive name and documentation
3. Add appropriate triggers
4. Use caching where applicable
5. Include error handling
6. Test locally before committing
7. Update this README

---

## Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Workflow Syntax](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)
- [Apache Spark Documentation](https://spark.apache.org/docs/latest/)
- [Apache Iceberg Documentation](https://iceberg.apache.org/)

---

## Support

For workflow issues:
1. Check Actions tab for error logs
2. Review this documentation
3. Check GitHub Actions status page
4. Open an issue with workflow logs

