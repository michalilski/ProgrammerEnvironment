#!/bin/bash

declare -A words

function process_file {
    local words_in_file=()
    while read -r line || [ -n "$line" ]
    do
        for word in $line 
        do
            if [[ words["$word"] && ! "${words_in_file[@]}" =~ "$word" ]]
            then
                (( words["$word"]+=1 ))
                words_in_file+=$word
            elif [[ !words["$word"] && ! "${words_in_file[@]}" =~ "$word" ]]
            then
                words["$word"]=1
            fi
        done
    done <$1
    words_in_file=()
}

function print_array {
    for word in ${!words[@]}
    do
        count=${words["$word"]}
        echo word = $word \| count = $count
    done
}

for file in `find $1 -type f`
do
    process_file $file
done

print_array