# This script has been repurposed to just extract the accesory proteins from just my assembly. These are shared with all the species so no need to go and extract it from every species, just one

def main():
    line = open("MRE.end").read().split('\n')

    f1 = open('Our_MREaccgenes.txt', 'x')
    for i in line:
        if ('GpMRE' in i) and ('8 taxa' not in i) and ('1 taxa' not in i):
            j = i.split('\t')
            for k in j:
                for l in k.split(' '):
                    if "GpMRE" in l:
                        f1.write(l.replace("(GpMRE)", "") + "\n")

    f1.close()



main()