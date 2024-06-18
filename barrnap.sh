#!/bin/bash

#This was then used used in blast to extract 16S for the phylogentic tree of Nostoc species
barrnap --quiet -k bac -o rrna.fa < ordered_18Npcontigs.fa > rrna.gff 

#once the 16S sequences were extracted, it went through the extact same pipeline in FastOrtho.sh, i.e. mafft -> catfasta2phyml -> trimal -> iqtree

