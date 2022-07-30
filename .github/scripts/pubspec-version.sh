#!/usr/bin/env bash

set -e

git fetch origin "$GITHUB_BASE_REF" --depth=1
diff=$(git diff origin/"$GITHUB_BASE_REF"..HEAD -- packages/"$PACKAGE"/pubspec.yaml)
version=$(awk '/\+version: /{print $2}' <<<"$diff")
echo "::set-output name=version::$version"

if [ -z "$version" ]; then
  echo '::set-output name=isNotEmpty::false'
else
  echo '::set-output name=isNotEmpty::true'
fi
