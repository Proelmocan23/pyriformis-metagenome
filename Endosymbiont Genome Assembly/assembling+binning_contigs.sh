#!/bin/bash

#Spades run with a few modification to the suggested parameters 
<sapdes.py Path>/spades.py -m 450 -k 21,33,55 --pe1-1 <paired-end forward read path> --pe1-2 <paired-end reverse read path> --mp1-1 <mate-pair forward read path> --mp1-2 <mate-pair reverse read path> 

#In preparation for CONCOCT, a sorted and indexed bam file was created which has metagenomic samples mapped against the contigs. This step was conducted with BWA alignment tool MEM. Using the author’s guidelines, the commands lines was as follows:
bwa index <Path to contigs.fasta>/contigs.fasta

bwa mem -M -t 5 <Path to contigs.fasta>/contigs.fasta <Path to forward paired-end reads>  <Path to reverse paired-end reads>  > pairedend1.sam

bwa mem -M -t 5 <Path to contigs.fasta>/contigs.fasta <Path to forward mate-pair reads> <Path to reverse mate-pair reads> > matepair1.sam

samtools view -b pairedend1.sam | samtools sort > pairedend1_sorted.bam

samtools view -b matepair1.sam | samtools sort > matepair1_sorted.bam

samtools merge merged_geo.bam pairedend1_sorted.bam matepair1_sorted.bam

samtools index merged_geo.bam

#CONCOCT

python3 <Path to cut_up_fasta.py> /cut_up_fasta.py contigs.fasta -c 10000 -o 0 --merge_last -b contigs_10K.bed > contigs_10K.fa

python3 <Path to concoct_coverage_table.py> /concoct_coverage_table.py contigs_10K.bed merged_geo.bam > coverage_table.tsv

<Path to CONCOCT>/concoct --composition_file contigs_10K.fa --coverage_file coverage_table.tsv -b concoct_output/

<Path to merge_cutup_clustering.py>/merge_cutup_clustering.py concoct_output/clustering_gt1000.csv > concoct_output/clustering_merged.csv

mkdir concoct_output/fasta_bins

<Path to extract_fasta_bins.py>/extract_fasta_bins.py contigs.fasta concoct_output/clustering_merged.csv --output_path concoct_output/fasta_bins

#Taxonomic assignment of the bins:

<Path to diamond-0.9.14>/diamond blastx -q contigs.fasta -d /shared/programs/nr_diamond/nr_diamond_out  -o geo_contigs_blastx  -f 0 --max-hsps 1 --top 10 -e 1e-5 -p 40

python3 parsingdiamondblast.py geo_contigs_blastx > output.tsv