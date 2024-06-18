# This script has been repurposed to just extract the core proteins from just my assembly. These are shared will all the species so no need to go and extract it from every species, just one
# Also this using "MRE.end we used for phylogenetics, so we don't care about mycoplasmoides_genitalium.
def main():
    line = open("MRE.end").read().split('\n')

    f1 = open('Our_MRE_8taxagenes.txt', 'x')
    for i in line:
        if ('8 taxa' in i):
            j = i.split('\t')
            for k in j:
                for l in k.split(' '):
                    if "GpMRE" in l:
                        f1.write(l.replace("(GpMRE)", "") + "\n")

    f1.close()



main()