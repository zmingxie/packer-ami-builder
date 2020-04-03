#!/bin/bash
set -ex

cd "${INPUT_WORKDIR:-.}"

# Run packer with the given arguments
packer ${INPUT_PACKERARGS}
