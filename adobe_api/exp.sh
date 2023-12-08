#!/bin/bash

export PDF_SERVICES_CLIENT_ID=xxxxxx
export PDF_SERVICES_CLIENT_SECRET=xxxxxx

input_dir="../toy_dataset"
output_dir="./output"
results_dir="./results"

mkdir -p "$output_dir"
mkdir -p "$results_dir"

for pdf_file in "$input_dir"/*.pdf; do
    base_name=$(basename "$pdf_file" .pdf)

    extracted_file="$output_dir/$base_name.zip"
    result_subdir="$results_dir/$base_name"
    backup_extracted="$result_subdir/extracted.zip"
    backup_parsed="$result_subdir/parsed.txt"

    mkdir -p "$result_subdir"

    python src/extractpdf/extract_txt_table_info_with_figure_tables_rendition_from_pdf.py --file_path "$pdf_file" --extracted_path "$extracted_file" 

    temp_dir=$(mktemp -d)
    unzip "$extracted_file" -d "$temp_dir"

    json_file_path="$temp_dir/structuredData.json"
    if [ -f "$json_file_path" ]; then
        python parse_output_json.py --parse_path "$json_file_path" --parse_out_path "$backup_parsed" 
    fi

    #cp -r "$temp_dir" "$result_subdir"
    cp "$extracted_file" "$backup_extracted"
    rm -rf "$temp_dir"

done

