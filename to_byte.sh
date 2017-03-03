#!/bin/bash

RC=1 # ReturnCode
PREFIX=("" "K" "M" "G" "T" "P")

for i in $(eval echo {0..$(( ${#PREFIX[*]} - 1 ))})
do
    if [ "${1//[0-9]}" == "${PREFIX[$i]}" ] ; then
        byte=$(( $(echo "${1%${PREFIX[$i]}} * 1024 ** ${i}") ))
        echo "${1} is ${byte}byte"
        RC=0
        break
    fi
done

exit ${RC}
