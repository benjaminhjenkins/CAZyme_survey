# Set up directory names and variables #

b=outputs/YOUR_OUTPUT_NAME

# Size filter # 

for d in $b/domains/*
do
	cd $d && seqtk seq -L 250 output_final_d.fasta > output_final_d_l250.fasta
	cd ~/run_dbcan
done


# Align, mask, and build tree #

for d in $b/domains/*
do
	cd $d && mafft output_final_d_l250.fasta > output_final_d_l250_aligned.fasta
	trimal -in output_final_d_l250_aligned.fasta -out output_final_d_l250_masked_0.9.fasta -gt 0.9
	iqtree -s output_final_d_l250_masked_0.9.fasta -nt AUTO -bb 1000
	cd ~/run_dbcan
done 
