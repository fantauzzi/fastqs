#!/bin/bash

mkdir -p fastQC

process_id() {
  fasterq-dump --outdir fastQC "$1"
}

# Export the function so that xargs can access it
export -f process_id

# Use xargs to run the command in parallel with a maximum of 16 processes
xargs -n 1 -P 16 -I {} bash -c 'process_id "{}"' <ids.txt
