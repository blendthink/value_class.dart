#!/usr/bin/env bash

echo 'fetch'
git fetch origin "$GITHUB_BASE_REF" --depth=1

echo 'diff'
diff=$(git diff origin/"$GITHUB_BASE_REF"..HEAD -- packages/"$PACKAGE"/pubspec.yaml)

echo 'version'
version=$(awk '/\+version: /{print $2}' <<<"$diff")

echo 'set-output'
echo "::set-output name=version::$version"

if [ -z "$version" ]; then
  echo '::set-output name=isNotEmpty::false'
else
  echo '::set-output name=isNotEmpty::true'
fi
