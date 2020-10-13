#!/bin/bash

declare -A words

function process_file {
    while read -r line || [ -n "$line" ]
    do
        for word in $(echo -e "${line// /\\n}"| sort -u)
        do
            if [[ $(echo $line | grep -o $word | wc -w) -gt 1 ]]; then
                echo file = $1 \| line = $line \| word = $word
            fi
        done
    done <$1
}

for file in `find $1 -type f`
do
    process_file $file
done