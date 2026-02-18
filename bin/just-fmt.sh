#!/usr/bin/env bash
set -euo pipefail

main() {
    for file in "$@";
    do
        just --unstable --fmt --justfile "${file}"
    done
}

main "$@"
