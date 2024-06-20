# pyriformis-metagenome

The folder labeled 'Endosymbiont Genome Assembly' contains the following scripts: 

- assembling+binning_contigs.sh -- contains the command-lines for SPAdes/CONCOCT/annotation with DIAMOND 

- mapping_contigs+QC.sh -- contains the command-lines for mapping the desired bins (in my case it was the bins labeled as 53.fa & 84.fa) back on to the metagenomic reads. Once these paired-end and mate paire reads were extracted, they were examined with FASTQC.

- Cutadapt.sh -- contains the command-lines used to remove duplication/overrepresentation 

- masurca.sh -- contains the command-lines used to produce scaffold level assemblies of the endosymbionts. These command-lines require sr_config.txt files which are also in this directory 

- filter_sequences.sh -- contains the script to remove any scaffolds shorter than 2kbp

- mapping_to_ref_Nostoc.sh -- contains the script to map the Nostoc assembly to the reference genome. The command-line executed in this script were similar to commands used to create supplementary Figure 2. 

- seqkit.sh -- contains the command-lines used to remove "junk scaffold". This shell script uses the seqlengaps.py script


###########################################################################
The folder labeled 'Endosymbiont Annotation' contains the following scripts: 

- Bakta.sh -- contains the command-lines used to annotate the genomes produced in this study. Similar commands were also executed with the other assemblies on the other assemblies analyzed in the study.

- busco.sh -- contains the command-lines for BUSCO. 'nostocales_odb10' & 'mollicutes_odb10' datasets were used in this study

- FastOrtho.sh -- contains the script for the FastOrtho analysis, which used the three .txt files (MRE9.txt, MRE8.txt, nostoc5.txt). The script used to generate Phylogenetic tree in Figure 3 is also in this shell script. The 14 SCO are in main for future studies. The shell script also uses single_copy_parser.py python script 

- COG.sh -- The directory contains the functional annotation pipeline for genomes. Included are the Python scripts merger_2.py, DIAMOND_COG2020_analysis_counter.py, extract_accesory_prot.py, and extract8taxagenes.py. The corresponding .txt output files are also available here. For the scripts FastOrthall.py, protnotinFO.py, and keeptopCOGhits.py, users must edit the scripts to update the species names for each new species of interest. Additionally, the extractparalogs.py script requires users to rename the .end file to match the FastOrtho results for different species. 

###########################################################################

The folder labeled 'Phylogenetic Analysis' contains the following scripts: 

- barrnap.sh -- contains the command-line used to create extract partial 16S sequence from the Nostoc-SAG assembly.  

###########################################################################

The folder labeled 'Inspecting cases of HGT' contains the following scripts: 

- diamondblastHGT.sh -- contains the command-lines used to protein blast the MRE species. The HGTcand.py parses through the blast results with the parameters detailed Sun et al. 2019. 

