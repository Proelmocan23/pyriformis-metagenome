#!/bin/bash

run-mummer3 GCF_000020025.1_ASM2002v1_genomic.fna after_removing_less2k.fa ref_qry

/home/madhu/mummer-4.0.0beta2/nucmer --maxgap=50 --mincluster=65 --minmatch=50 --breaklen=400 --prefix=ref_qry GCF_000020025.1_ASM2002v1_genomic.fna after_removing_less2k.fa 

/home/madhu/mummer-4.0.0beta2/show-coords  -lcr ref_qry.delta > ref_qry.coord

/home/madhu/mummer-4.0.0beta2/delta-filter -q -r ref_qry.delta > ref_qry.filter

/home/madhu/mummer-4.0.0beta2/mummerplot -layout -large ref_qry.filter --png -R GCF_000020025.1_ASM2002v1_genomic.fna -Q after_removing_less2k.fa
