#!/bin/bash

set -e
echo "Analyzing library for warnings or type errors"

dartanalyzer --show-package-warnings example/ lib/
dart --checked test/lipsum_test.dart

echo -e "\n[32m✓ OK[0m"
