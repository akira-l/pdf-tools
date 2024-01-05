import os 
import json 
import argparse
from pathlib import Path

import tika 
tika.initVM() 
from tika import parser 

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

    extract_cont = parser.from_file(args.file_path)
    # >>> parsed.keys()
    # dict_keys(['metadata', 'content', 'status'])
    
    txt_handle.write(extract_cont['content'])
    txt_handle.close() 


