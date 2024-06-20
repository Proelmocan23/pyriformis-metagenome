import pandas as pd

# Read the Diamond output file
df = pd.read_csv('Peltigera_membranacea_cyanobiont_uni.cogs', sep='\t', header=None) #replace name here

top_hits = df.groupby(0).apply(lambda x: x.nlargest(1, 11))
top_hits.reset_index(drop=True, inplace=True)

# Write the top hits to a new output file, make sure to change name here
top_hits.to_csv('top_PMC_uni.cogs', sep='\t', header=False, index=False)
