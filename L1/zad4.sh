#!/bin/bash

declare -A words

function process_file {
    counter=0
    while read -r line || [ -n "$line" ]
    do
        (( counter+=1 ))
        for word in $line 
        do
            echo file = $1 \| line = $counter \| word = $word
        done
    done <$1
}

for file in `find $1 -type f`
do
    process_file $file
done