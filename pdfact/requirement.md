```bash
conda create -n layoutlmft python=3.7
conda activate layoutlmft
git clone https://github.com/microsoft/unilm.git
cd unilm/
ls
cd layoutlm
cd ..
cd layoutlmft/
pip install -r requirements.txt
pip install -e .

cd /data/path/code/
cd pdf-benchmark/
export PYTHONPATH=/data/path/code/pdf-benchmark
pip install similarity
pip install strsim
pip install beautifulsoup4
pip install lxml
pip install grobid-client

git clone https://github.com/kermitt2/grobid_client_python
cd grobid_client_python
python3 setup.py install
cd ..
export PYTHONPATH=/data/path/code/pdf-benchmark/grobid_client_python:$PYTHONPATH
pip install python-Levenshtein
pip install PyPDF2


git clone https://github.com/ad-freiburg/pdfact.git
cd pdfact
apt-get update -y 
apt-get upgrade -y 
apt-get install -y maven
mvn install
