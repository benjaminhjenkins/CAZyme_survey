# Set up directory names and variables #

b=outputs/YOUR_OUTPUT_NAME
c="outputs/YOUR_OUTPUT_NAME"
e=/YOUR_BROADER_SPECIES_DATASET_PATH

# BLASTp output against your desired sequence dataset #

for d in $b/domains/*
do
	cd $d && blastp -query output.fas -db $e -out output_homologues_e50.tab -evalue 1e-50 -outfmt 6
	cut -f 2 output_homologues_e50.tab > output_homologues_e50.tab.hits
	faSomeRecords $e output_homologues_e50.tab.hits output_homologues_e50.fasta
	cd ~/run_dbcan
done 

# Concatenate fasta files, de-duplicate #

for d in $b/domains/*
do
	cd $d && cat *.fasta > output_final.fasta
	awk '/^>/{f=!d[$1];d[$1]=1}f' output_final.fasta > output_final_d.fasta
	cd ~/run_dbcan
done
