#!/bin/bash -eu

DIRECTORY1=${1}

if ! [[ -d ${DIRECTORY1} ]]; then 
    exit
fi

for FILE in $(find "$DIRECTORY1" -mindepth 1 -depth)
do
    if [[ -f ${FILE} && ${FILE##*.} == "bak" ]]; then 
        chmod go-w ${FILE}
    elif [[ -d ${FILE} && ${FILE##*.} == "bak" ]]; then 
        chmod o+x ${FILE}
    elif [[ -f ${FILE} && ${FILE##*.} == "tmp" ]]; then 
        chmod u+rwx,g+wx,o+wx ${FILE}
    elif [[ -f ${FILE} && ${FILE##*.} == "txt" ]]; then 
        chmod u=r,g=wr,o=x ${FILE}
    elif [[ -f ${FILE} && ${FILE##*.} == "exe" ]]; then 
        chmod u+s ${FILE}
    fi
done
