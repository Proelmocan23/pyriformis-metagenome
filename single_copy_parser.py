#this is to parse through all the single copies found in your ".end file" after your your ran FastOrtho.
from Bio import SeqIO

def main():
    # you may remove the "MRE.end" for another .end file of your choice
    dotend_file = open("MRE.end").readlines()

    fasta_list = ["CeMRE", "DeMREI-1", "DeMREI-2", "DeMREII", "DhMRE", "GpMRE", "mycoplasmoides_genitalium", "RcMRE", "RvMRE"]
    for i in dotend_file:
        if '(9 genes,9 taxa)' in i:
            i = i.split(' ')
            for j in fasta_list:
                for k in i:
                    if j in k:
                        #open the protein fasta and read in the sequence
                        with open (j+'.faa', 'r') as handle:
                            records = list(SeqIO.parse(handle, "fasta"))
                            #Search for a sequence with the given ID
                            for record in records:
                                if k.replace("("+j+")", "").replace('\n',"") in record.id:
                                    record.id = j
                                    with open(i[0].replace('(9 genes,9 taxa)', "").strip()+ ".faa","a+") as output_handle:
                                        SeqIO.write(record, output_handle, "fasta")

if __name__ == "__main__":
    main()
