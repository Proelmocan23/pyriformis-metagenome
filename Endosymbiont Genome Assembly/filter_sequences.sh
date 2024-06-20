#!/bin/bash

#don't forget to make this executable by using: chmod 755 filter_sequences.sh
perl -ne 'if(/^>(.*)$/){$id=$1; $hash{$id}="";} else{chomp; $hash{$id}.=$_;} END{foreach $k(keys %hash){if (length $hash{$k} >= 2000){print ">",$k,"\n",$hash{$k},"\n";}}}' <original_contigs.fa> > after_2k_removed.fa
