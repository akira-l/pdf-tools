#!/bin/bash

docker run -p 127.0.0.1:8080:8080 --rm --init ucrel/ucrel-science-parse:3.0.1 & 
sleep 5 

input_dir="../toy_dataset"
output_dir="./output"
results_dir="./results"

mkdir -p "$output_dir"
mkdir -p "$results_dir"

for pdf_file in "$input_dir"/*.pdf; do
    base_name=$(basename "$pdf_file" .pdf)
    extracted_file="$output_dir/$base_name.txt"

    python test_sciparse.py --parse_path "$pdf_file" --parse_out_path "$extracted_file" 

done

