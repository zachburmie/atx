#!/bin/sh
# quick AWS Context Switcher

set -eu

if [ ! -x "$(which aws-okta 2>/dev/null)" ]; then
  echo "please install: aws-okta" >&2
  exit 1
fi
if [ ! -x "$(which fzf 2>/dev/null)" ]; then
  echo "please install: fzf (https://github.com/junegunn/fzf)" >&2
  exit 1
fi

if readlink "$0" >/dev/null; then
  source="$(readlink "$0")"
  dir=$(cd "$(dirname "$0")/$(dirname "$source")" && pwd)
  prefix="$dir/.."
else
  prefix="$(dirname "$0")/.."
fi

current=$AWS_OKTA_PROFILE
selected=$( (aws-okta list | awk '{print $1}'; echo "${current}")  \
            | fzf -0 -1 --tac -q "${1:-""}" --prompt "$current> " --preview "$prefix/helpers/atx-preview.sh {}")
if [ ! -z "$selected" ]; then
  aws-okta exec "${selected}" -- bash
fi
