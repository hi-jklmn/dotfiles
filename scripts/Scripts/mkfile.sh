#!/bin/sh

# mkfile.sh [PATH/]FILE
# subsequent arguments ignored

[ -z "$1" ] && {
    printf "ERROR: mkfile.sh, insufficient arguments"
    exit 1
}

mkdir -p "${1%/*}" && touch "$1"
