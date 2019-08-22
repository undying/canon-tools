#! /bin/bash

CWD=$(readlink -f ${0})
CWD=${CWD%/*}

source ${CWD}/ufraw.sh

exposures=(
  -2
  -1.{9..1}
  -1
  -0.{9..1}
  0
  0.{1..9}
  1
  1.{1..9}
  2
)


for f in ${*};do
  if [[ -z "${f}" ]];then
    echo "no raw file specified"
    exit 1
  fi

  if [[ ! -e "${f}" ]];then
    echo "file ${f} not found"
    exit 1
  fi

  name=${f%.*}

  set -x
  count=0
  for e in ${exposures[@]};do
    ufraw-batch \
      ${UFRAW_ARGS} \
      --out-type=tiff \
      --out-depth=16 \
      --exposure="${e}" \
      --noexif \
      --output="exposure_${name}_${count}.tif" \
      ${f}

    count=$[count+1]
  done
done

