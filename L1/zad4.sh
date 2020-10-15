#!/bin/bash

all_files=`find $1 -type f`

function process_files {
    for word in $all_words
    do
        echo $word
        for file in $all_files
        do 
            for line in $(grep -w -n $word $file | sed 's/[A-Za-z]*//g')
            do
                echo '  ' file: $file '|' line: ${line::-1}
            done
        done
    done
}

all_words=""

for file in $all_files
do
    all_words+=$(cat $file)
    all_words+=" "
done
all_words=$(echo $all_words | tr " " "\n" | awk 'NF' | sort -u)
process_files
