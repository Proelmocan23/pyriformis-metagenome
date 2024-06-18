#!/bin/bash

# mapping cluster 53 back to the reads and we are mapping it back on to the metagenomic reads

# cluster 53 is going to be our reference 
bwa index 53.fa


# alignmetn with 53 as ref and paired-end as quary 
bwa mem -M -t 5 53.fa <Path to forward paired-end reads>  <Path to reverse paired-end reads> > 53Aln_pe.sam


# alignmet with 53 as the ref and mate-pair as quary 
bwa mem -M -t 5 53.fa <Path to forward mate-pair reads> <Path to reverse mate-pair reads> > 53Aln_mp.sam


#creating a bam file 
samtools view -b 53Aln_pe.sam | samtools sort > 53pairedend1_sorted.bam

#creating a bam file 
samtools view -b 53Aln_mp.sam | samtools sort > 53matepair1_sorted.bam

#Index pairedend
samtools index 53pairedend1_sorted.bam

#Index mate-pair
samtools index 53matepair1_sorted.bam

#Extracting the reads that were mapped properly as pairs only
samtools view -u -f 1 -F 12 53pairedend1_sorted.bam > 53pairedend1_map_map.bam

#order them by read ID
samtools sort -n 53pairedend1_map_map.bam -o 53pairedend1_mapped.sort.bam

#extracting fastq reads 
bamToFastq -i 53pairedend1_mapped.sort.bam -fq 53pairedend1_mapped.1.fastq -fq2 53pairedend1_mapped.2.fastq 

#running fastqc 
fastqc 53pairedend1_mapped.1.fastq & fastqc 53pairedend1_mapped.2.fastq

#Extracting the reads that were mapped properly as pairs only
samtools view -u -f 1 -F 12 53matepair1_sorted.bam > 53matepair1_map_map.bam

#order them by read ID
samtools sort -n 53matepair1_map_map.bam -o 53matepair1_mapped.sort.bam

#extracting fastq reads 
bamToFastq -i 53matepair1_mapped.sort.bam -fq 53matepair1_mapped.1.fastq -fq2 53matepair1_mapped.2.fastq 

#running fastqc 
fastqc 53matepair1_mapped.1.fastq & fastqc 53matepair1_mapped.2.fastq

############################################################################################################################################################################

#!/bin/bash

# cluster 84 is going to be our reference and we are mapping it back on the metagenomic reads 
bwa index 84.fa

# alignmetn with 84 as ref and paired-end as quary 
bwa mem -M -t 5 84.fa <Path to forward paired-end reads>  <Path to reverse paired-end reads> > 84Aln_pe.sam

# alignmet with 84 as the ref and mate-pair as quary 
bwa mem -M -t 5 84.fa <Path to forward mate-pair reads> <Path to reverse mate-pair reads> > 84Aln_mp.sam

#creating a bam file 
samtools view -b 84Aln_pe.sam | samtools sort > 84pairedend1_sorted.bam

#creating a bam file 
samtools view -b 84Aln_mp.sam | samtools sort > 84matepair1_sorted.bam

#Index pairedend
samtools index 84pairedend1_sorted.bam

#Index mate-pair
samtools index 84matepair1_sorted.bam

#Extracting the reads that were mapped properly as pairs only
samtools view -u -f 1 -F 12 84pairedend1_sorted.bam > 84pairedend1_map_map.bam

#order them by read ID
samtools sort -n 84pairedend1_map_map.bam -o 84pairedend1_mapped.sort.bam

#extracting fastq reads 
bamToFastq -i 84pairedend1_mapped.sort.bam -fq 84pairedend1_mapped.1.fastq -fq2 84pairedend1_mapped.2.fastq

#running fastqc 
fastqc 84pairedend1_mapped.1.fastq & fastqc 84pairedend1_mapped.2.fastq

#Extracting the reads that were mapped properly as pairs only
samtools view -u -f 1 -F 12 84matepair1_sorted.bam > 84matepair1_map_map.bam

#order them by read ID
samtools sort -n 84matepair1_map_map.bam -o 84matepair1_mapped.sort.bam

#extracting fastq reads 
bamToFastq -i 84matepair1_mapped.sort.bam -fq 84matepair1_mapped.1.fastq -fq2 84matepair1_mapped.2.fastq

#running fastqc 
fastqc 84matepair1_mapped.1.fastq & fastqc 84matepair1_mapped.2.fastq

