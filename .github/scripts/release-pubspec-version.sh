#!/usr/bin/env bash

content=$(cat packages/"$PACKAGE"/pubspec.yaml)
version=$(awk '/version: /{print $2}' <<<"$content")
echo "::set-output name=version::$version"
