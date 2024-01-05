#!/bin/bash

input_dir="../toy_dataset"
output_dir="./output"
results_dir="./results"

mkdir -p "$output_dir"
mkdir -p "$results_dir"

for pdf_file in "$input_dir"/*.pdf; do
    base_name=$(basename "$pdf_file" .pdf)
    extracted_file="$output_dir/$base_name.txt"

    python test_tika.py --parse_path "$pdf_file" --parse_out_path "$extracted_file" 

done

