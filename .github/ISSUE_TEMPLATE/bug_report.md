---
name: Bug Report
about: Create a report to help us improve
title: '[BUG] '
labels: bug
assignees: ''
---

## Bug Description
<!-- A clear and concise description of what the bug is -->

## Environment
- **OS:** [e.g., Ubuntu 20.04, macOS 13.0, Windows 11]
- **Java Version:** [e.g., OpenJDK 8, Oracle JDK 11]
- **Spark Version:** [e.g., 3.5.1]
- **Scala Version:** [e.g., 2.12.10]
- **Project Version:** [e.g., 0.1.0-SNAPSHOT]

## Steps to Reproduce
<!-- Steps to reproduce the behavior -->

1. Set environment: `export SPARK_HOME=...`
2. Run command: `./bin/dsdgen ...`
3. Observe error: ...
4. See error output below

## Expected Behavior
<!-- A clear and concise description of what you expected to happen -->

## Actual Behavior
<!-- A clear and concise description of what actually happened -->

## Error Output
<!-- Paste the complete error message and stack trace -->

```
# Paste error output here
```

## Command Used
<!-- Paste the exact command you ran -->

```bash
./bin/dsdgen \
  --output-location ... \
  --scale-factor ... \
  ...
```

## Configuration
<!-- If applicable, paste relevant configuration -->

**Spark Configuration:**
```
spark.hadoop.fs.s3a.endpoint=...
```

**Environment Variables:**
```bash
SPARK_HOME=...
AWS_ACCESS_KEY_ID=...
```

## Logs
<!-- Attach or paste relevant log files -->

<details>
<summary>Full logs</summary>

```
# Paste logs here
```

</details>

## Screenshots
<!-- If applicable, add screenshots to help explain your problem -->

## Workaround
<!-- If you found a workaround, describe it here -->

## Additional Context
<!-- Add any other context about the problem here -->

## Checklist
- [ ] I have searched existing issues to ensure this is not a duplicate
- [ ] I have provided all requested information
- [ ] I have included error logs and stack traces
- [ ] I have tested with the latest version

