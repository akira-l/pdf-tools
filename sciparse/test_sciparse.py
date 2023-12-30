import os 
import json 
import argparse
from pathlib import Path

from science_parse_api.api import parse_pdf

import pdb 


def parse_args():
    parser = argparse.ArgumentParser(description='parse json')
    parser.add_argument('--parse_path', dest='file_path',
                        default='', type=str)
    parser.add_argument('--parse_out_path', dest='out_path',
                        default='', type=str)
    args = parser.parse_args()
    return args

if __name__ == '__main__':
    args = parse_args()
    txt_handle = open(args.out_path, 'a') 
    pdf_path = Path(args.file_path).resolve()

    host = 'http://127.0.0.1'
    port = '8080'

    extract_cont = parse_pdf(host, pdf_path, port=port)
    for cont in extract_cont['sections']: 
        text = cont['text'] 
        txt_handle.write(text + '\n') 
    txt_handle.close() 

