def main():
    lines = open("nostoc_five_species.end").read().split('\n') # change the name here to thr .end file you're analyzing
    with open('PMC-all-orthoprot.txt', 'w') as f: #here change the name of the file to species of interest
        for i in lines:
            if "Peltigera_membranacea_cyanobiont" in i:  #here change the name of the file to the species of interest in .end file
                entries = i.split('\t')[1].split()
                for k in entries:
                    if "Peltigera_membranacea_cyanobiont" in k: #here change the name of the file to the species of interest in the .end file
                        f.write(k.replace('(Peltigera_membranacea_cyanobiont)', '') + '\n') #here change the name of the file to the species of interest in the .end file

main()
