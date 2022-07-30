#!/usr/bin/env bash

git fetch origin "$BASE_REF" --depth=1
diff=$(git diff origin/main..HEAD -- packages/"$PACKAGE"/pubspec.yaml)
version=$(awk '/\+version: /{print $2}' <<<"$diff")
echo "::set-output name=version::$version"

if [ -z "$version" ]; then
  echo '::set-output name=isNotEmpty::false'
else
  echo '::set-output name=isNotEmpty::true'
fi
