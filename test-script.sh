#!/bin/bash

REZ=0
BREZ=-1

while [ $BREZ -ne 0 ]; do

    bash ./main-script.sh > /dev/null 2>&1
    REZ=$?

    if [ "$REZ" = "0" ]; then
        echo "********* GOOD Branch **********"
        git status | grep " at "
        git bisect good | grep 'is the first bad commit'
        BREZ=$?
    else
        echo "********** BAD Branch **********"
        git status | grep " at "
        git bisect bad | grep 'is the first bad commit'
        BREZ=$?
    fi

done
git bisect view
