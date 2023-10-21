#!/bin/bash

# Run `flutter pub get` in all the packages


find . -type f -name "pubspec.yaml" -exec dirname {} \; | while read -r dir; do
  cd "$dir" || exit
  echo "🔦 Getting dependencies for: $dir"
  flutter pub get
  cd - || exit
done