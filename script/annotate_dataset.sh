# Set up directory names and variables #

a=/YOUR_DATASET_PATH
b=outputs/YOUR_OUTPUT_NAME
c="outputs/YOUR_OUTPUT_NAME"

# Run dbCAN on your sequence dataset (specify protein or nucleotide dataset) #

run_dbcan $a protein --out_dir $b

# Format overview file for extract #

sed -i 's/([^(]*)//g' "$b/overview.txt"
sed '1d' "$b/overview.txt" > "$b/overview_trimmed.txt"

# Make 'domains' directory, make sub-directories using CAZY family names #

mkdir "$b/domains"
awk -v c="$c" '{ print "mkdir "c"/domains/"$3}' "$b/overview_trimmed.txt" | bash
awk -v c="$c" '{ print "mkdir "c"/domains/"$4}' "$b/overview_trimmed.txt" | bash
awk -v c="$c" '{ print "mkdir "c"/domains/"$5}' "$b/overview_trimmed.txt" | bash

# Write output values to sub-directories #

awk -v c="$c" '{print >> ""c"/domains/"$3"/output.tab"}' "$b/overview_trimmed.txt"
awk -v c="$c" '{print >> ""c"/domains/"$4"/output.tab"}' "$b/overview_trimmed.txt"
awk -v c="$c" '{print >> ""c"/domains/"$5"/output.tab"}' "$b/overview_trimmed.txt"

# Cut sequence name for each value, extract sequence from original database, and make fasta file #

for d in $b/domains/*
do
         cd $d && cut -f 1 output.tab > output.tab.hits
         faSomeRecords $a output.tab.hits output.fas
         cd ~/run_dbcan        
done
