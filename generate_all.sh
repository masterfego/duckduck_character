#!/bin/bash

# Run `build runner` in all the packages that required it

find . -type f -name "pubspec.yaml" -exec dirname {} \; | while read -r dir; do
  if grep -q "build_runner" "$dir/pubspec.yaml"; then
    cd "$dir" || exit
    flutter packages pub run build_runner build --delete-conflicting-outputs
    cd - || exit
  fi
done