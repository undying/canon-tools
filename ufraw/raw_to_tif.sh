#! /bin/bash

CWD=$(readlink -f ${0})
CWD=${CWD%/*}

source ${CWD}/ufraw.sh

for f in ${*};do
  if [[ -z "${f}" ]];then
    echo "no raw file specified"
    exit 1
  fi

  if [[ ! -e "${f}" ]];then
    echo "file ${f} not found"
    exit 1
  fi

  set -x
  ufraw-batch \
    ${UFRAW_ARGS} \
    --out-type=tiff \
    --out-depth=16 \
    ${f}
done

