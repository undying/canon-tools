#! /bin/bash

if [[ ${#} -lt 2 ]];then
  echo "for stacking need >2 images"
  exit 1
fi

prefix=enfused_
index=0

while [[ ${1:${index}:1} -eq ${2:${index}:1} ]];do
  prefix+=${1:${index}:1}
  index=$[index+1]
done

prefix=${prefix%.*}

enfuse \
  -v \
  --output="${prefix}.tif" \
  --gray-projector=l-star \
  --contrast-edge-scale=0.3 \
  --exposure-weight=1 \
  --saturation-weight=0.2 \
  --contrast-weight=0 \
  --soft-mask \
  ${@}

