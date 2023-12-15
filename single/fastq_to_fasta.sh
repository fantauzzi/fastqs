#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Convert a FASTQ file to a FASTA file"
  echo "Usage: $0 fastq_filename fasta_filename"
  exit 1
fi

fastq=$1
fasta=$2

paste - - - - <"$fastq" >"$fastq.tab.tmp"
awk '{print $1 "\t" $4}' "$fastq.tab.tmp" |
  sed 's/^@/>/' >"$fastq.tab2.tmp"
awk '{print $1, "\n" $2}' "$fastq.tab2.tmp" >"$fasta"
rm "$fastq.tab.tmp" "$fastq.tab2.tmp"
