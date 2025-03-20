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
    SED_SCRIPT='/^$/N;/^\n$/D'

    # macOS / Linux incompatibility issues
    # thanks <https://stackoverflow.com/a/4247319/138757>
    if [ "$(uname)" == "Linux" ]; then
        SED_CMD=(sed --in-place "${SED_SCRIPT}")
    else
        # assuming macOS for now
        SED_CMD=(sed -i '' -e "${SED_SCRIPT}")
    fi
}

main() {
    init
    "${SED_CMD[@]}" "$@"
    terraform fmt "$@"
}

main "$@"
