#!/bin/sh
# atx preview window helper

set -eu

selected=$1

context=$(aws-okta list | awk '{ for(i=1; i<=NF; i++){ if($1 == "'${selected}'"){print $i}}}' | tr '\r\n' ' ')
profile=$(echo "${context}" | awk '{print $1}')
arn=$(echo "${context}" | awk '{print $2}')
source=$(echo "${context}" | awk '{print $3}')

if readlink "$0" >/dev/null; then
  source="$(readlink "$0")"
  dir=$(cd "$(dirname "$0")/$(dirname "$source")" && pwd)
  prefix="$dir/.."
else
  prefix="$(dirname "$0")/.."
fi

echo "=== ${selected} ==="
echo
echo "Profile ${profile};ARN ${arn};Source ${source};" | tr ';' '\n' | column -t
