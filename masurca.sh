#!/bin/bash

#steps for running masurca to create the MRE scaffolds
/install_path/ MaSuRCA-X.X.X/bin/masurca sr_config_for_MRE_.txt

bash assemble.sh

#steps for running masurca to create the Nostoc scaffolds, run these in a different directory 
/install_path/ MaSuRCA-X.X.X/bin/masurca sr_config_for_Nostoc_.txt

bash assemble.sh