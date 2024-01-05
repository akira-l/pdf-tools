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

pip install tika 