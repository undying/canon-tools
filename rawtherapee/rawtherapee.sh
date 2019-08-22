
CWD=$(readlink -f ${0})
CWD=${CWD%/*}

RAWTHERAPEE_ARGS="\
  -p ${CWD}/profiles/IMG_0648.CR2.pp3 \
"

