import os
# a script created to extract all the "1 taxa" categories from the FastOrtho analysis
# make you change the name of the .end file at the end of the script, change the part after "input_file_name ="

def extract_sequences(input_file_name, output_directory, faa_files_directory):

    with open(input_file_name, 'r') as file:
        for line in file:
            if '1 taxa' in line:
                entries = line.split('\t')[1].split()
                for entry in entries:
                    name, species = entry.split('(')
                    species = species.strip(')')

                    faa_file_name = f"{species}.faa"
                    faa_file_path = os.path.join(faa_files_directory, faa_file_name)

                    if os.path.exists(faa_file_path):
                        with open(faa_file_path, 'r') as faa_file:
                            sequence_found = False
                            sequence = ''
                            for faa_line in faa_file:
                                if faa_line.startswith('>') and name in faa_line:
                                    sequence_found = True
                                    sequence = faa_line
                                elif faa_line.startswith('>') and sequence_found:
                                    break
                                elif sequence_found:
                                    sequence += faa_line

                            if sequence_found:
                                output_file_name = f"{species}_para.faa"
                                output_file_path = os.path.join(output_directory, output_file_name)
                                # Append the sequence to the species-specific file
                                with open(output_file_path, 'a') as output_file:
                                    output_file.write(sequence)
                    else:
                        print(f"File not found: {faa_file_path}")

input_file_name = 'nostoc_five_species.end'  # This is the .end file from the FastOrtho analysis
output_directory = '.'  # Current directory
faa_files_directory = '.'  # Current directory for .faa files

# Create output directory if it doesn't exist
os.makedirs(output_directory, exist_ok=True)

# Run the function
extract_sequences(input_file_name, output_directory, faa_files_directory)
