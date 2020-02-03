#!/bin/bash

s=$(readlink -f "$0")
d=$(dirname "$0")
export PATH="$d:$PATH"

if (( $# == 0 )); then
    cat <<EOF
Subcommands:
  cipherscan [arg ...]
  analyze.py [arg ...]

Example:

  cipherscan www.example.com
  analyze.py -l intermediate -t www.example.com

EOF
    exit 1
fi

# Run command as pid 1:
exec "$@"
