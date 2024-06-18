#!/bin/bash

################################################### These are all steps to build a COG database ###################################################

# donwnloading the COG database
wget ftp://ftp.ncbi.nlm.nih.gov/pub/COG/COG2020/data/

python merger_2.py cog-20.fa cog-20.cog.csv cog-20.def.tab

#make the COG databse compatible with Diamond search
diamond makedb --in merged_cogs.fa -d COG_diamond.dmnd


##################################################### Annotating the unique proteins found in each Nostoc assembly #####################################################

## All these unique proteins were identified using the .end file from the FastOrtho analysis, need to run them per species

python FastOrthall.py #make sure you change the names inside the script 
python protnotinFO.py #make sure you change the names inside the script

# need to run this once but make sure you change the name of the .end fie
python extractparalogs.py

#combine the fasta files fasta files like so, all these files were used also used for KEGG annotation using BLASTKOLA (https://www.kegg.jp/blastkoala/):
cat PMC-nonFO-prot.faa Peltigera_membranacea_cyanobiont_uni.faa > PMC_uni.faa
cat NpPCC-nonFO-prot.faa Reference_Nostoc_GCF_000020025.1_uni.faa > Np-PCC_uni.faa
cat NpSAG-nonFO-prot.faa ordered_18Npcontigs_uni.faa > NP-SAG_uni.faa
cat Ns-nonFO-prot.faa Nostoc_sphaeroides_uni.faa > Ns_uni.faa
cat Ne-nonFO-prot.faa Nostoc_edaphicum_uni.faa > Ne_uni.faa

#Ne-CCNP1411
diamond blastp --db /New_share/New_share/COG_diamond/COG_diamond.dmnd -q Ne_uni.faa -a Nostoc_edaphicum_uni.cogs
wait
diamond view --daa Nostoc_edaphicum_uni.cogs.daa -o Nostoc_edaphicum_uni.cogs -f tab
wait
#Ns-Kutzing En
diamond blastp --db /New_share/New_share/COG_diamond/COG_diamond.dmnd -q Ns_uni.faa -a Nostoc_sphaeroides_uni.cogs
wait
diamond view --daa Nostoc_sphaeroides_uni.cogs.daa -o Nostoc_sphaeroides_uni.cogs -f tab
wait
python DIAMOND_COG2020_analysis_counter.py -I Nostoc_sphaeroides_uni.cogs -O Nostoc_edaphicum_uniresult.cogs -D merged_cogs.fa
wait
#Nsp. PMC N6
diamond blastp --db /New_share/New_share/COG_diamond/COG_diamond.dmnd -q PMC_uni.faa -a Peltigera_membranacea_cyanobiont_uni.cogs
wait
diamond view --daa Peltigera_membranacea_cyanobiont_uni.cogs.daa -o Peltigera_membranacea_cyanobiont_uni.cogs -f tab
wait
#Np-SAG 69.79
diamond blastp --db /New_share/New_share/COG_diamond/COG_diamond.dmnd -q NP-SAG_uni.faa -a NP-SAG_uni.cogs
wait
diamond view --daa NP-SAG_uni.cogs.daa -o NP-SAG_uni.cogs -f tab
#Np-PCC 73102
diamond blastp --db /New_share/New_share/COG_diamond/COG_diamond.dmnd -q Np-PCC_uni.faa -a Np-PCC_uni.cogs
wait
diamond view --daa Np-PCC_uni.cogs.daa -o Np-PCC_uni.cogs -f tab

############################################ run keeptopCOGhit.py #######################################################

#run this script indivdually for each species 
python keeptopCOGhits.py # open this script and change the name for each species

#run the counter 

python DIAMOND_COG2020_analysis_counter.py -I top_NE_uni.cogs -O top_NE_uni_result.cogs -D merged_cogs.fa
python DIAMOND_COG2020_analysis_counter.py -I top_NP-PCC_uni.cogs -O top_NP-PCC_uni_result.cogs -D merged_cogs.fa
python DIAMOND_COG2020_analysis_counter.py -I top_NS_uni.cogs -O top_NS_uni_result.cogs -D merged_cogs.fa
python DIAMOND_COG2020_analysis_counter.py -I top_PMC_uni.cogs -O top_PMC_uni_result.cogs -D merged_cogs.fa
python DIAMOND_COG2020_analysis_counter.py -I top_NP-SAG_uni.cogs -O top_NP-SAG_uni_result.cogs -D merged_cogs.fa

##################################################### Annotating the core proteins found in each Nostoc assembly #####################################################

# a script to extract the core protein from the Nostoc-SAG

python extract5taxagenes.py # this uses the .end file from the FastOthro analysis

seqtk subseq ordered_18Npcontigs.faa Our_nostoc_5taxagenes.txt  > Nostoc_core_protCOG.faa
diamond blastp --db /New_share/New_share/COG_diamond/COG_diamond.dmnd -q Nostoc_core_protCOG.faa -a nostoc_core.cogs
wait
diamond view --daa nostoc_core.cogs.daa -o nostoc_core.cogs -f tab

# run keeptopCOGhits.py but make sure you change the names in inside the script
python keeptopCOGhits.py 
python DIAMOND_COG2020_analysis_counter.py -I top_nostoc_core.cogs -O top_nostoc_core_result.cogs -D merged_cogs.fa

##################################################### Annotating the core proteins found in each MRE assembly #####################################################

# this uses the .end file after the MRE FastOrtho analysis
python extract8taxagenes.py

seqtk subseq GpMRE.faa Our_MRE_8taxagenes.txt > MRE_core_protCOG.faa

diamond blastp --db /New_share/New_share/COG_diamond/COG_diamond.dmnd -q MRE_core_protCOG.faa -a MRE_core.cogs
wait
diamond view --daa MRE_core.cogs.daa -o MRE_core.cogs -f tab

#run this script indivdually for each species 
python keeptopCOGhits.py # open this script and change the name for each species

python DIAMOND_COG2020_analysis_counter.py -I top_MRE_core.cogs -O top_MRE_core_result.cogs -D merged_cogs.fa

##################################################### Annotating the unique proteins found in GpMRE assembly #####################################################

## All these unique proteins were identified using the .end file from the FastOrtho analysis, need to run them per species

python FastOrthall.py #make sure you change the names inside the script 
python protnotinFO.py #make sure you change the names inside the script

# need to run this once but make sure you change the name of the .end fie
python extractparalogs.py

#combine the fasta files fasta files like so, I have shown how to create a fasta file with unique prots found in GpMRE but you can do this with other MREs too:
#This file was also used for KEGG annotation with BLASTKOLA: https://www.kegg.jp/blastkoala/
cat GpMRE-nonFO-prot.faa GpMRE_para.faa > GpMRE_uni.faa

diamond blastp --db /New_share/New_share/COG_diamond/COG_diamond.dmnd -q GpMRE_uni_protCOG.faa -a GpMRE_uni.cogs
wait
diamond view --daa GpMRE_uni.cogs.daa -o GpMRE_uni.cogs -f tab

#run this script indivdually for each species 
python keeptopCOGhits.py # open this script and change the name for each species

python DIAMOND_COG2020_analysis_counter.py -I top_GpMRE_uni.cogs -O top_GpMRE_core_result.cogs -D merged_cogs.fa

##################################################### Annotating the differentially present prots found in GpMRE assembly #####################################################

python extract_accesory_prot.py 

# MRE_acc_prot.faa was used to for KEGG annotation using BLASTKOLA
seqtk subseq GpMRE.faa Our_MREaccgenes.txt  > MRE_acc_prot.faa

