#!/bin/bash

# you can you also use the  fasta files at this stage in Proksee for genome visualization 
bakta --db <path to bakta db> ordered_18Npcontigs.fa --output ./

# This is for the MRE, similar command was used for all the nucleotide fasta files for AMF MRE genomes
bakta --db <path to bakta db> ordered_3contigs.fasta --output ./

