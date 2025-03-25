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
    AWK_SCRIPT='
!/^$/ { prev_empty = 0 }
/^$/ {
  if (prev_empty) {
    next  # skip this line
  }
  prev_empty = 1
}
{ print }
'
}

main() {
    init
    for file in "$@"; do
        cleaned_contents="$(awk "${AWK_SCRIPT}" "${file}")"
        echo "${cleaned_contents}" > "${file}"
    done
    terraform fmt "$@"
}

main "$@"
