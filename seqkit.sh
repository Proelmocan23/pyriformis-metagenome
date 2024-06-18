#!/bin/bash

python seqlen+gaps.y <Nostoc_masurca>.fa Nostoc_seq_length.txt

#This is to remove junk nostoc contigs, the name.txt file should be a list of names of the scaffolds you want to remove, which you can identify by running the seqlen+gaps.py script
seqtk subseq after_removing_less2k.fa names.txt  > 18Npcontigs.fa
seqkit sort --by-length --reverse 18Npcontigs.fa > ordered_18Npcontigs.fa

# visualization of how the scaffolds map onto the reference assembly, this plot was used for SFigure 1


run-mummer3 ordered_18Npcontigs.fa GCF_000020025.1_ASM2002v1_genomic.fna ref_qry

/home/madhu/mummer-4.0.0beta2/nucmer --maxgap=50 --mincluster=65 --minmatch=50 --breaklen=400 --prefix=ref_qry ordered_18Npcontigs.fa GCF_000020025.1_ASM2002v1_genomic.fna  

/home/madhu/mummer-4.0.0beta2/show-coords  -B -lcr ref_qry.delta > ref_qry.coord

/home/madhu/mummer-4.0.0beta2/delta-filter -q -r ref_qry.delta > ref_qry.filter

/home/madhu/mummer-4.0.0beta2/mummerplot -layout -large ref_qry.filter --png -R ordered_18Npcontigs.fa -Q ordered_18Npcontigs.faa

##################################################################### Moving onto the MRE assembly #####################################################################

python seqlen+gaps.y <MRE_masurca>.fa MRE_seq_length.txt

# The GC content for the scaffold was also inspected
infoseq after_removing_2k.fa -only -desc -name -length -pgc

#To remove junk MRE scaffolds

seqtk subseq after_removing_2k.fa names.txt > 3contigs.fasta

/home/madhu/seqtk/seqkit sort --by-length --reverse 3contigs.fasta > ordered_3contigs.fasta
