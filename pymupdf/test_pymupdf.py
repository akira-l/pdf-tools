import os 
import json 
import argparse
from pathlib import Path

import fitz 

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

    extract_cont = fitz.open(args.file_path)
    gather_cont = []
    for page in extract_cont: 
        text = page.get_text() 
        # text = page.get_text("dict", sort=True)
        gather_cont.append(text) 
        
    write_cont = '\n'.join(gather_cont)
    txt_handle.write(write_cont)
    txt_handle.close() 


