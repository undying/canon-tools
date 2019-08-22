#! /bin/bash

from="${1}"
to="${2}"

if [[ -z "${from}" ]];then
  echo "no source specified"
  exit 1
fi

if [[ -z "${to}" ]];then
  echo "no destination specified"
  exit 1
fi

set -x
exiftool \
  -tagsFromFile \
  "${from}" "${to}"

