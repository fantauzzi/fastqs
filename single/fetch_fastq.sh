#!/bin/bash

mkdir -p fastQC
while read -r f; do
  fasterq-dump --outdir fastQC "$f" --progress --threads 4
done <ids.txt
