# Iceberg Spark TPC-DS Benchmark

This is a TPCDS data generator and queries benchmark for Apache Spark. It also supports Iceberg data, which is forked from [spark-tpcds-datagen](https://github.com/maropu/spark-tpcds-datagen)

## 🚀 Build Status

[![CI Build and Test](../../actions/workflows/ci.yml/badge.svg)](../../actions/workflows/ci.yml)
[![Code Quality](../../actions/workflows/code-quality.yml/badge.svg)](../../actions/workflows/code-quality.yml)
[![Integration Tests](../../actions/workflows/integration-tests.yml/badge.svg)](../../actions/workflows/integration-tests.yml)
[![Performance Benchmarks](../../actions/workflows/benchmarks.yml/badge.svg)](../../actions/workflows/benchmarks.yml)

## ℹ️ Version Information

**Spark Support:** 3.5.1  
**Scala Version:** 2.12.10  
**Java Support:** 8, 11

Note that the current `master` branch intends to support [Spark 3.5.1](https://downloads.apache.org/spark/spark-3.5.1) on Scala 2.12.x.

## 📖 Documentation

- **[Quick Start Guide](QUICK_START.md)** - Fast reference with copy-paste examples
- **[Iceberg Usage Guide](ICEBERG_USAGE_GUIDE.md)** - Complete guide for creating and querying Iceberg tables
- **[Workflows Documentation](.github/workflows/README.md)** - GitHub Actions CI/CD documentation
## How to generate TPCDS data

You can generate TPCDS data in `/tmp/spark-tpcds-data`:

    # You need to set `SPARK_HOME` to your Spark v3.3.2 path before running a command below
    $ ./bin/dsdgen --output-location /tmp/spark-tpcds-data [--iceberg]

## Options for the generator

    $ ./bin/dsdgen --help
    Usage: spark-submit --class <this class> --conf key=value <spark tpcds datagen jar> [Options]
    Options:
      --output-location [STR]                Path to an output location
      --scale-factor [NUM]                   Scale factor (default: 1)
      --format [STR]                         Output format (default: parquet)
      --overwrite                            Whether it overwrites existing data (default: false)
      --iceberg                              Whether it generate iceberg data (default: false)
      --iceberg-database [STR]              Iceberg database name (default: tpcds)
      --partition-tables                     Whether it partitions output data (default: false)
      --use-double-for-decimal               Whether it prefers double types instead of decimal types (default: false)
      --use-string-for-char                  Whether it prefers string types instead of char/varchar types (default: false)
      --cluster-by-partition-columns         Whether it cluster output data by partition columns (default: false)
      --filter-out-null-partition-values     Whether it filters out NULL partitions (default: false)
      --table-filter [STR]                   Queries to filter, e.g., catalog_sales,store_sales
      --num-partitions [NUM]                 # of partitions (default: 100)

## Options for the queries
    Options:
      --data-location      Path to TPCDS data
      --query-filter       Queries to filter, e.g., q3,q5,q13
      --cbo                Whether to enable cost-based optimization
      --iceberg            Whether queries iceberg tables
      --iceberg-database   Iceberg database name (default: tpcds)

## Run specific TPCDS quries only

To run a part of TPCDS queries, you type:

    $ ./bin/run-tpcds-benchmark --data-location [TPCDS data/Iceberg TPCDS data] --query-filter "q2,q5" [--iceberg]