#!/bin/bash

SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}

if [[ -d ${TARGET_DIR} ]]; then 
    rm -rf ${TARGET_DIR}
fi

mkdir ${TARGET_DIR}

ITEMS=$(cat ${RM_LIST})

echo "${ITEMS}"

#debug
set -x
for ITEM in ${ITEMS}; do
    if [[ -e ${SOURCE_DIR}/${ITEM} ]]; then
        if [[ -f ${SOURCE_DIR}/${ITEM} ]]; then
            rm -f ${SOURCE_DIR}/${ITEM}
        elif [[ -d ${SOURCE_DIR}/${ITEM} ]]; then
            rm -rf ${SOURCE_DIR}/${ITEM}
        fi
    fi

done

COUNTER=0
for FILE in $(find "$SOURCE_DIR" -mindepth 1 -depth)
do
    if [[ -f ${FILE} ]]; then 
        mv -f "${FILE}" "${TARGET_DIR}"
    elif [[ -d ${FILE} ]]; then 
        mv -f "${FILE}" "${TARGET_DIR}"
    else
        COUNTER=$((COUNTER+1))
    fi
done

if [[ ${COUNTER} -ge 2 ]]; then
    echo "zostały co najmniej 2 pliki"
fi
if [[ ${COUNTER} -gt 4 ]]; then
    echo "zostało więcej niż 4 pliki"
fi
if [[ ${COUNTER} -ge 2 && $(COUNTER ) -le 4 ]]; then
    echo "coś piszemy"
fi
if [[ ${COUNTER} -eq 0 ]]; then
    echo "tu był Kononowicz"
fi

mydate=$(date +%Y-%m-%d)

zip -r bakap_${mydate}.zip ${TARGET_DIR}