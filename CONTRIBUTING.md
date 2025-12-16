# Contributing to Iceberg Spark TPC-DS Benchmark

Thank you for your interest in contributing to the Iceberg Spark TPC-DS Benchmark project! This document provides guidelines and instructions for contributing.

## Table of Contents
- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Making Changes](#making-changes)
- [Testing](#testing)
- [Submitting Changes](#submitting-changes)
- [Code Style](#code-style)
- [Commit Messages](#commit-messages)
- [Pull Request Process](#pull-request-process)

## Code of Conduct

This project follows the Apache Software Foundation Code of Conduct. Please be respectful and professional in all interactions.

## Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/iceberg-spark-tpcds-benchmark.git
   cd iceberg-spark-tpcds-benchmark
   ```
3. **Add upstream remote**:
   ```bash
   git remote add upstream https://github.com/ORIGINAL_OWNER/iceberg-spark-tpcds-benchmark.git
   ```

## Development Setup

### Prerequisites
- Java 8 or 11
- Maven 3.6.3+
- Apache Spark 3.5.1+
- Scala 2.12.10

### Build the project
```bash
./build/mvn clean package
```

### Run tests
```bash
./build/mvn test
```

### Run style checks
```bash
./build/mvn scalastyle:check
```

### Set up Spark
```bash
export SPARK_HOME=/path/to/spark-3.5.1
```

## Making Changes

### Create a feature branch
```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-bug-fix
```

### Branch naming conventions
- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation updates
- `refactor/` - Code refactoring
- `test/` - Test improvements
- `ci/` - CI/CD changes

## Testing

### Unit Tests
Always add tests for new features:
```scala
// src/test/scala/org/apache/spark/sql/execution/benchmark/YourTest.scala
class YourTest extends FunSuite {
  test("your test description") {
    // Test implementation
  }
}
```

### Integration Tests
Test data generation locally:
```bash
./bin/dsdgen \
  --output-location /tmp/test-output \
  --scale-factor 1 \
  --iceberg \
  --table-filter "customer"
```

### Manual Testing Checklist
- [ ] Parquet data generation works
- [ ] Iceberg data generation works
- [ ] S3 paths work correctly
- [ ] HDFS paths work correctly
- [ ] Partition tables work correctly
- [ ] Query benchmarks run successfully

## Submitting Changes

### Before submitting
1. **Update your branch** with latest upstream:
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

2. **Run all tests**:
   ```bash
   ./build/mvn clean test
   ```

3. **Check code style**:
   ```bash
   ./build/mvn scalastyle:check
   ```

4. **Update documentation** if needed

### Push your changes
```bash
git push origin feature/your-feature-name
```

## Code Style

This project follows Spark's Scala style guide.

### Key points
- Use 2 spaces for indentation
- Maximum line length: 100 characters
- Use meaningful variable names
- Add comments for complex logic
- Follow Scala naming conventions:
  - Classes: `PascalCase`
  - Methods/variables: `camelCase`
  - Constants: `UPPER_SNAKE_CASE`

### Scalastyle
The project uses Scalastyle for code style checking. Configuration is in `scalastyle-config.xml`.

Run checks:
```bash
./build/mvn scalastyle:check
```

## Commit Messages

### Format
```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting)
- `refactor`: Code refactoring
- `test`: Test additions or changes
- `chore`: Build process or auxiliary tool changes
- `ci`: CI/CD changes

### Examples
```
feat(datagen): add support for custom database names

Added --iceberg-database parameter to allow users to specify
custom database names for Iceberg table generation.

Closes #123
```

```
fix(catalog): use hadoop catalog instead of hive for output location

Changed Iceberg catalog type from 'hive' to 'hadoop' to ensure
the --output-location parameter is properly honored.

Fixes #456
```

## Pull Request Process

### 1. Create Pull Request
- Use a clear, descriptive title
- Fill out the PR template completely
- Reference related issues
- Add appropriate labels

### 2. PR Title Format
Follow conventional commits:
```
feat: add new feature
fix: resolve bug
docs: update documentation
```

### 3. PR Description
Include:
- **What**: What changes were made
- **Why**: Why these changes are needed
- **How**: How the changes work
- **Testing**: How changes were tested
- **Screenshots**: If applicable

### 4. Review Process
- Address review comments promptly
- Keep discussions focused and professional
- Request re-review after making changes
- Be open to feedback

### 5. CI Checks
All checks must pass:
- ✅ Build succeeds
- ✅ Tests pass
- ✅ Code style checks pass
- ✅ No merge conflicts

### 6. Merging
- PRs require approval from maintainers
- Squash and merge is preferred
- Delete branch after merge

## Areas for Contribution

### High Priority
- [ ] Additional Iceberg features support
- [ ] Performance optimizations
- [ ] Better error handling
- [ ] Enhanced documentation
- [ ] More comprehensive tests

### Good First Issues
- Documentation improvements
- Code comments and cleanup
- Test coverage improvements
- Bug fixes in data generation
- Shell script enhancements

### Feature Ideas
- Support for more storage formats
- Additional benchmark queries
- Cloud storage optimizations
- Monitoring and metrics
- Configuration file support

## Documentation

### When to update docs
- Adding new features
- Changing CLI parameters
- Modifying workflows
- Changing dependencies
- Updating version requirements

### Documentation files
- `README.md` - Main project documentation
- `QUICK_START.md` - Quick start guide
- `ICEBERG_USAGE_GUIDE.md` - Iceberg usage documentation
- `.github/workflows/README.md` - Workflow documentation
- Code comments and Scaladoc

## Testing Guidelines

### Test coverage
- Aim for >80% code coverage
- Test happy paths and edge cases
- Test error conditions
- Test with different configurations

### Test types
1. **Unit tests** - Test individual components
2. **Integration tests** - Test end-to-end workflows
3. **Performance tests** - Benchmark critical paths

## Release Process

Releases are automated via GitHub Actions:

1. Update version in `pom.xml`
2. Create and push tag:
   ```bash
   git tag -a v0.2.0 -m "Release version 0.2.0"
   git push origin v0.2.0
   ```
3. GitHub Actions creates the release automatically

## Getting Help

### Resources
- [Project README](README.md)
- [Quick Start Guide](QUICK_START.md)
- [Iceberg Usage Guide](ICEBERG_USAGE_GUIDE.md)
- [GitHub Issues](../../issues)
- [GitHub Discussions](../../discussions)

### Communication
- **Issues**: Bug reports and feature requests
- **Discussions**: Questions and general discussion
- **Pull Requests**: Code contributions

## License

By contributing, you agree that your contributions will be licensed under the Apache License 2.0.

## Recognition

Contributors will be recognized in:
- Release notes
- GitHub contributors page
- Project documentation (if significant contribution)

---

Thank you for contributing to Iceberg Spark TPC-DS Benchmark! 🎉

