#! /bin/bash

for f in ${*};do
  if [[ -z "${f}" ]];then
    echo "no raw file specified"
    exit 1
  fi

  if [[ ! -e "${f}" ]];then
    echo "file ${f} not found"
    exit 1
  fi

  jpegoptim \
    -m95 \
    ${f}
done

