#!/bin/bash

cutadapt -a AGAGAGAGAGAGAGAGAGAGAGAGAGAGAG -o out.MP1.fastq -p out.MP2.fastq 84matepair1_mapped.1.fastq 84matepair1_mapped.2.fastq

cutadapt -a AGAGAGAGAGAGAGAGAGAGAGAGAGAGAG -A AGAGAGAGAGAGAGAGAGAGAGAGAGAGAG -o out.PE1.fastq -p out.PE2.fastq 84pairedend1_mapped.1.fastq 84pairedend1_mapped.2.fastq
