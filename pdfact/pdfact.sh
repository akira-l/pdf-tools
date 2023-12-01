#!/bin/bash 

PATH_TO_DIR=$1

#find "$PATH_TO_DIR" -type f -name "*.pdf"

for pdf_file in "$PATH_TO_DIR"/*.pdf
do
    if [ -f "$pdf_file" ]
    then
	base_name=$(basename "$pdf_file" .pdf)
        pdfact_output="${PATH_TO_DIR}/${base_name}_output.json"
	./PdfAct/pdfact/bin/pdfact --format json "$pdf_file" "$pdfact_output"
	echo "generate $pdfact_output"
    fi
done
