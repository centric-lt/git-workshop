#!/bin/bash

REZ=0
bash ./test-script.sh
REZ=$?

if [ "$REZ" = 0 ]; then
    git bisect good
else
    git git bisect bad
fi
