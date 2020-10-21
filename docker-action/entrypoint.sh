#!/bin/bash
set -e

cd "${INPUT_WORKDIR:-.}"

# Show Packer version
packer version

# Run packer with the given arguments
packer ${INPUT_PACKERARGS}
