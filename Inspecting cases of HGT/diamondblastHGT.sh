#!/bin/bash

#diamond blastp -q ordered_3contigs.faa  -d /media/eniac/WD3/essam/nr_database/nr_diamond.dmnd  --outfmt 6 qseqid qlen sseqid sallseqid slen qstart qend sstart send sscinames sskingdoms skingdoms sphylums -o Gpblastpresults -e 1e-5 -p 25 --query-cover 50 --subject-cover 50
#wait
#double-checking if other MREs have same issues
diamond blastp -q CeMRE.faa -d /media/eniac/WD3/essam/nr_database/nr_diamond.dmnd  --outfmt 6 qseqid qlen sseqid sallseqid slen qstart qend sstart send sscinames sskingdoms skingdoms sphylums -o CEblastpresults -e 1e-5 -p 25 --query-cover 50 --subject-cover 50
wait
diamond blastp -q DeMREI-1.faa -d /media/eniac/WD3/essam/nr_database/nr_diamond.dmnd  --outfmt 6 qseqid qlen sseqid sallseqid slen qstart qend sstart send sscinames sskingdoms skingdoms sphylums -o DeMREI-1blastpresults -e 1e-5 -p 25 --query-cover 50 --subject-cover 50
wait
diamond blastp -q DeMREI-2.faa -d /media/eniac/WD3/essam/nr_database/nr_diamond.dmnd  --outfmt 6 qseqid qlen sseqid sallseqid slen qstart qend sstart send sscinames sskingdoms skingdoms sphylums -o DeMREI-2blastpresults -e 1e-5 -p 25 --query-cover 50 --subject-cover 50
wait
diamond blastp -q DhMRE.faa -d /media/eniac/WD3/essam/nr_database/nr_diamond.dmnd  --outfmt 6 qseqid qlen sseqid sallseqid slen qstart qend sstart send sscinames sskingdoms skingdoms sphylums -o DhMREblastpresults -e 1e-5 -p 25 --query-cover 50 --subject-cover 50
wait
diamond blastp -q DeMREII.faa -d /media/eniac/WD3/essam/nr_database/nr_diamond.dmnd  --outfmt 6 qseqid qlen sseqid sallseqid slen qstart qend sstart send sscinames sskingdoms skingdoms sphylums -o DeMREIIblastpresults -e 1e-5 -p 25 --query-cover 50 --subject-cover 50
wait 
diamond blastp -q RcMRE.faa -d /media/eniac/WD3/essam/nr_database/nr_diamond.dmnd  --outfmt 6 qseqid qlen sseqid sallseqid slen qstart qend sstart send sscinames sskingdoms skingdoms sphylums -o RcMREblastpresults -e 1e-5 -p 25 --query-cover 50 --subject-cover 50
wait
diamond blastp -q RvMRE.faa -d /media/eniac/WD3/essam/nr_database/nr_diamond.dmnd  --outfmt 6 qseqid qlen sseqid sallseqid slen qstart qend sstart send sscinames sskingdoms skingdoms sphylums -o RvMREblastpresults -e 1e-5 -p 25 --query-cover 50 --subject-cover 50

# After this I used a scrpt to parse through them to identify potential HGT candiates: 

python HGTcand.py # make sure to change the names of the species for each of the species 