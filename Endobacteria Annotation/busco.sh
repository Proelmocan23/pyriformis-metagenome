#!/bin/bash

#Nostoc BUSCO
busco \
	-i <name of the .fa file>\
	-o 18C_nosto_gen \
	-l /media/madhu/WD2017X014/essam/nostocales_odb10\ # make sure to download this dataset
	-c 25 \
	-m genome \
	-f

busco \
	-i <name of the .faa file> \
	-o refnostoc_pro\
	-l /media/madhu/WD2017X013/essam/nostocales_odb10\ # make sure to download this dataset
	-c 25 \
	-m proteins \
	-f \

# MRE BUSCO

busco \
	-i <name of the fasta file>\
	-o busco_RcMRE_molli \
	-l /media/madhu/WD2017X014/essam/endobacteria/mollicutes_odb10\ # make sure to download this dataset
	-c 25 \
	-m genome\
	-f
