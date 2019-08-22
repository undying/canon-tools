#! /bin/bash

CPU=$(grep -c processor /proc/cpuinfo)

function remove_raw(){
  local raw="${1}"

  for n in jpg JPG jpeg JPEG;do
    local f="${raw%.*}.${n}"
    if [[ -e "${f}" ]];then
      echo "exists: ${f}, removing: ${raw}"
      rm "${raw}"

      return 0
    fi
  done

  return 1
}
export -f remove_raw

echo "this script will remove RAW if jpeg is present"
echo "Continue? (y/n)"

read line

case ${line} in
  [yY]|[yY][eE][sS])
    break;;
  *)
    echo "exiting..."
    exit 1
esac

if [[ -z "${*}" ]];then
  echo "no search path specified"
  exit 1
fi

find ${*} \
  -type f \
  -iname '*.CR2' \
    |xargs -L1 -P${CPU} -I{} bash -c 'remove_raw "{}"'

