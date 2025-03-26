#!/usr/bin/env bash
set -euo pipefail

main() {
    for file in "$@";
    do
        base_dir="$(dirname "${file}")"
        terraform -chdir="${base_dir}" providers lock \
            -platform=darwin_arm64 \
            -platform=darwin_amd64 \
            -platform=linux_amd64
    done
}

main "$@"
