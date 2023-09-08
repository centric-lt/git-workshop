#!/bin/bash

REZ=0
BREZ=-1

while [ $BREZ -ne 0 ]; do

    bash ./main-script.sh > /dev/null 2>&1
    REZ=$?

    if [ "$REZ" = "0" ]; then
        echo "********* GOOD Branch **********"
        git status | grep " at "
        git bisect good | grep -q '0 revisions left to test after this'
        BREZ=$?
    else
        echo "********** BAD Branch **********"
        git status | grep " at "
        git bisect bad | grep -q '0 revisions left to test after this'
        BREZ=$?
    fi

done

git status
