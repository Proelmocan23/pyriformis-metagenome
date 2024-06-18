# A script used to look through my blastp results and ID potenital candiates for HGT
def main():
    file = open("GpMREblastpresults").readlines() #change the name to the species of interest
    f1 = open("GpMREHGTcand.tsv", 'a+') #change the name to the species of interest

    x = []
    a = 0 #Eukaryota
    b = 0 #bacteria
    for i in file:
        j = i.split('\t')
        if j[0] not in x:
            #The first if statement prints out what the previous counts were and resets the counter
            if (b == 0) and (a > 0):
                f1.write(x[-1] + '\t'+ 'No hits with bacteria, number of hits with Eukaryotes' + '\t' + str(a) + '\n')
                a = 0
                b = 0
            elif b>0 and ((a/b)>2):
                f1.write(x[-1] + '\t' + 'Ratio of Eukaryotes to Bacteria is' + '\t' + str((a/b)) + '\n')
                a = 0
                b = 0
            else:
                a = 0
                b = 0
            #The second if statement starts the count again
            if j[10] == 'Eukaryota':
                x.append(j[0])
                a = a + 1
            elif (j[10] == 'Bacteria') and ('MRE' not in j[9]):
                x.append(j[0])
                b = b + 1
            else:
                x.append(j[0])

        #This continues with the count
        elif j[0] in x:
            if j[10] == 'Eukaryota':
                a = a + 1
            if (j[10] == 'Bacteria') and ('MRE' not in j[9]):
                b = b + 1


    f1.close()


if __name__ == "__main__":
    main()