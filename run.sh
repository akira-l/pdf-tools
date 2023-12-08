
# export PYTHONPATH=/data/path/code/pdf-benchmark
# export PYTHONPATH=/data/path/code/pdf-benchmark/grobid_client_python:$PYTHONPATH
# python PdfAct/pdfact_extract.py

# pdfact 
bash pdfact/pdfact.sh ./toy_dataset

# adobe api 
cd adobe_api 
bash exp.sh 