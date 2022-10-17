#!/usr/bin/env bash

dataset_path="C:/Datasets/gen_1"
chars="0123456789!\"#$%&'()*+,-./:;<=>?@[\]^_\`{|}~ €≥≤ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

rm -rf "${dataset_path}/faults"
mkdir "${dataset_path}/faults"
python run.py -cpu 4 -na 2 -rs -ch "${chars}" -c 10000 --output_dir "${dataset_path}/train"
rm -rf "${dataset_path}/faults"
mkdir "${dataset_path}/faults"
python run.py -cpu 4 -na 2 -rs -ch "${chars}" -c 1000 --output_dir "${dataset_path}/val"
rm -rf "${dataset_path}/faults"
mkdir "${dataset_path}/faults"
python run.py -cpu 4 -na 2 -rs -ch "${chars}" -c 1000 --output_dir "${dataset_path}/test"

# zip "${dataset_path}/dataset.zip" -r train val test

