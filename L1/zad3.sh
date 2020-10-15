#!/bin/bash

function process_file {
   cat $file | tr " " "\n" | sort -u | awk 'NF'
}

for file in `find $1 -type f`
do
    process_file $file 
done | sort | uniq -c