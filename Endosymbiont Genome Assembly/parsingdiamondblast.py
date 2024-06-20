#This is a simple script to parse diamond blast results. This will give you your Query and the species that aligned to it.
#usage: python3 parsingdiamondblast.py input > output.tsv
#!/usr/bin/env python
import sys

def main():
    infile = open(sys.argv[1])
    line = infile.readlines()
    query=""
    x = 0

    for i in line:
        x = x + 1
        if "Query= " in i:
            x = 0
            query = i.split(" ")[1]
        elif x == 4:
            end = i.find("]")
            start = i.rfind('[', 0, end) + 1
            substring = i[start:end]
            print(query + "\t" + substring)

    infile.close()


main()