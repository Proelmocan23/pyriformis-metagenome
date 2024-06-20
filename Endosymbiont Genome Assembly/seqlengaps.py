#!usr/bin/env python
# Usage:
# python script.py fasta.fa seq_length.tsv
import sys

file_open = open(sys.argv[1], 'r').readlines()
file_out = open(sys.argv[2], 'w')
file_out.write("Contig" + '\t' + "seq_length" + '\t' + 'N_count'+ '\t' + 'Percentage_of_N'+ '\n')

switch = 0
for lines in file_open:
    if '>' in lines:
        if switch == 0:
            file_out.write(lines.strip() + "\t")
            seq_length = 0
            N_count = 0
            switch = 1
        elif switch == 1:

            file_out.write(str(seq_length) + "\t" + str(N_count) + "\t"+ str((N_count/seq_length)*100) + "\n" + lines.strip() + "\t")
            seq_length = 0
            N_count = 0
    else:
        seq_length += len(lines.strip())
        N_count += lines.count('N')

file_out.write(str(seq_length) + "\t" + str(N_count) + "\t"+ str((N_count/seq_length)*100))

