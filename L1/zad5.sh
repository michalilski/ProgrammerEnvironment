#!/bin/bash

function process_file {
    printf "%s" "$(cat $1 | tr a A)" > $1
}

for file in `find $1 -type f`
do
    process_file $file
done