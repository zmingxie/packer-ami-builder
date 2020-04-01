#!/bin/bash
set -e

cd "${INPUT_WORKDIR:-.}"

# By default, HCL_MODE is disabled
HCL_MODE=false
if [[ ${INPUT_TEMPLATEFILE} == '.' || ${INPUT_TEMPLATEFILE} =~ '*.pkr.hcl' ]]; then
  HCL_MODE=true
fi
echo "[INFO] HCL_MODE is ${HCL_MODE}"

if [[ "${HCL_MODE}" == false && ! -f "${INPUT_TEMPLATEFILE}" ]]; then
  echo "Error! Template file [${INPUT_TEMPLATEFILE}] is not found!"
  exit 1
fi

# Validate the template (Currently doesn't work with HCL files)
if [[ "${HCL_MODE}" == false ]]; then
  packer validate ${INPUT_TEMPLATEFILE}
  if [[ $? -ne 0 ]]; then
    echo "Error! Packer template is not valid"
    exit 1
  fi
fi

if [[ -f "${INPUT_VARFILE}" ]]; then
  VAR_FILE_FLAG="-var-file=${INPUT_VARFILE}"
else
  VAR_FILE_FLAG=""
fi

# Run packer build
packer build ${VAR_FILE_FLAG} ${INPUT_TEMPLATEFILE}
