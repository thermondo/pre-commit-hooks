#!/usr/bin/env bash
set -euo pipefail

tflint --init
SCRIPT_DIR="$(pwd)"
# NOTE: `tflint` needs the full path to the config file here, otherwise it
# will look for the `.tflint.hcl` file in every single subdirectory
tflint --recursive --config="${SCRIPT_DIR}/.tflint.hcl" --fix
