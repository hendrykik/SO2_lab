#!/bin/bash -eu

DIRECTORY1=${1}
DIRECTORY2=${2}

if ! [[ -d ${DIRECTORY1} ]]; then 
    exit
fi

if ! [[ -d ${DIRECTORY2} ]]; then 
    exit
fi

for FILE in $(find "$DIRECTORY1" -mindepth 1 -depth)
do
    if [[ -f ${FILE} ]]; then 
        echo "to plik regulany"
    elif [[ -d ${FILE} ]]; then 
        echo "to katalog"
    fi

    if [[ -f ${FILE} ]]; then 
        echo " to dowiazanie symboliczne"
    fi

    ln -s ${FILE} $DIRECTORY2
done

for FILE in $(find "$DIRECTORY2" -mindepth 1 -depth)
do
    NEW_FILE="$(echo "$FILE" | tr '[:lower:]' '[:upper:]')"
    NEW_FILE+="_ln"
    mv ${FILE} ${NEW_FILE}
    #if [[ -f ${FILE} ]]; then 
    #    mv "${file}" "${file^^}_ln.txt"
done
