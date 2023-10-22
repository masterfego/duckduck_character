#!/bin/bash

# Loop through directories that contain a subdirectory named "test"
find . -type d -name "test" -exec dirname {} \; | while read -r dir; do
  cd "$dir" || exit 1
  echo "🧪 Running test in $dir "
  flutter test --no-pub
  cd - || exit 1
done