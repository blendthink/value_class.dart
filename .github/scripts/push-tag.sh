#!/usr/bin/env bash

tag="$PACKAGE-v$VERSION"
git tag "$tag"
git push origin "$tag"
