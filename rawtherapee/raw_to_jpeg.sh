#! /bin/bash

CWD=$(readlink -f ${0})
CWD=${CWD%/*}

source ${CWD}/rawtherapee.sh

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
  rawtherapee-cli \
    ${RAWTHERAPEE_ARGS} \
    -j100 \
    -c "${f}"
  set +x

  exit
  [ "${?}" -ne 0 ] && exit 1

  jpegoptim \
    -m95 \
    ${f%.*}.jpg
done

