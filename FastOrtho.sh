#!/bin/bash

#Nostoc FastOrtho
#Remember to also run the Bakta protein prediction tool for ALL the species, and use the .faa output for this analysis  
/home/madhu/FastOrtho/src/FastOrtho nostoc5.txt

##################################################################################MRE FastOrtho to identify the 14 SCO and create a phylogentic tree (figure 5)##################################################################################

#MRE FastOrtho 
#Remember to also run the Bakta protein prediction tool for ALL the species, and use the .faa output for this analysis  

/home/madhu/FastOrtho/src/FastOrtho MRE9.txt

#I created a py script to create all these SCO fasta files

python single_copy_parser.py 


# all the tree in this project followed a similar pipeline of mafft -> catfasta2phyml.pl -> trimal -> iqtree

mafft --localpair --maxiterate 1000  --auto ORTHOMCL98.faa > aln98
mafft --localpair --maxiterate 1000  --auto ORTHOMCL104.faa > aln104
mafft --localpair --maxiterate 1000  --auto ORTHOMCL105.faa > aln105
mafft --localpair --maxiterate 1000  --auto ORTHOMCL111.faa > aln111
mafft --localpair --maxiterate 1000  --auto ORTHOMCL114.faa > aln114
mafft --localpair --maxiterate 1000  --auto ORTHOMCL117.faa > aln117
mafft --localpair --maxiterate 1000  --auto ORTHOMCL118.faa > aln118
mafft --localpair --maxiterate 1000  --auto ORTHOMCL122.faa > aln122
mafft --localpair --maxiterate 1000  --auto ORTHOMCL125.faa > aln125
mafft --localpair --maxiterate 1000  --auto ORTHOMCL128.faa > aln128
mafft --localpair --maxiterate 1000  --auto ORTHOMCL129.faa > aln129
mafft --localpair --maxiterate 1000  --auto ORTHOMCL134.faa > aln134
mafft --localpair --maxiterate 1000  --auto ORTHOMCL135.faa > aln135
mafft --localpair --maxiterate 1000  --auto ORTHOMCL136.faa > aln136

perl /home/madhu/catfasta2phyml/catfasta2phyml.pl -c  aln98  aln104  aln105  aln111  aln114  aln117  aln118  aln122  aln125  aln128  aln129  aln134  aln135  aln136 > all_alignment.phy
/home/madhu/trimal/source/trimal -in all_alignment.phy -phylip  -out singlescp_trimalout -gt 0.9

# We know the outgroup from this paper: https://doi.org/10.1073/pnas.1501540112
iqtree -s all_alignment.phy -o mycoplasmoides_genitalium