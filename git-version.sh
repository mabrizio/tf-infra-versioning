#!/bin/bash

set -e

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${CWD}"
git_version=$(git describe --abbrev=0)
jq -n --arg version "${git_version}" '{"infra_version":$version}'
