#!/bin/bash
up="0000000 033 133 101"
down="0000000 033 133 102"
right="0000000 033 133 103"
left="0000000 033 133 104"
enter="0000000 015"

while :
do
    stty raw -echo
    input=$(dd bs=10 count=1 2>/dev/null)
    stty -raw echo

    keycode=$(echo -n $input | od -b | sed -n 1p)
    case $keycode in
        $up) echo -n "UP";;
        $down) echo -n "DOWN";;
        $left) echo -n "LEFT";;
        $right) echo -n "RIGHT";;
        $enter) echo "ENTER";break;;
    esac
done
