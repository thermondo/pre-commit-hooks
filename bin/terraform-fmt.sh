#!/usr/bin/env bash
#
# Remove excessive empty lines and run `terraform fmt` on files
#
# Example usage:
#
#     ./terraform-fmt.sh foo.tf bar.tf
#

set -euo pipefail

init() {
    if command -v gsed &>/dev/null; then
        SED_CMD="gsed"
    else
        SED_CMD="sed"
    fi
}

main() {
    init
    $SED_CMD -i '/^$/N;/^\n$/D' "$@"
    terraform fmt "$@"
}

main "$@"
