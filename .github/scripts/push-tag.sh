#!/usr/bin/env bash

set -e

tag="$PACKAGE-v$VERSION"
git tag "$tag"
git push origin "$tag"
