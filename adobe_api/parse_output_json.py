import os 
import json 
import argparse

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
    cont = json.load(open(args.file_path))
    txt_handle = open(args.out_path, 'a') 
    # p cont.keys(): dict_keys(['version', 'extended_metadata', 'elements', 'pages']) 
    for sub_ele in cont['elements']: 
        if 'Text' in sub_ele: 
            ele_text = sub_ele['Text'] 
            txt_handle.write(ele_text + '\n') 
    txt_handle.close() 


