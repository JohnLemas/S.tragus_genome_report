# usr/bin/env bash

######
# Title: Synteny between A and B chromosomes in the SalTrRef Genome
# Description: This script will generate the files required for synteny plots in RIdeogram.
######

DATE=`date +%Y-%m-%d`

genome="/Users/jmlemas/SalTrGenome/fresh_genomes/SalTr_v01.fasta"

karyotype="/Users/jmlemas/SalTrGenome/SalTrGenome_Ref/01_input/SalTr_Ref_karyotype.txt"

outputdir="/Users/jmlemas/SalTrGenome/SalTrGenome_Ref/03_output"

A_chroms="${outputdir}/SalTr_Ref_A_chroms.fasta"

B_chroms="${outputdir}/SalTr_Ref_B_chroms.fasta"

synteny_out="${outputdir}/Achrom_Bchrom.paf"

ragtag_out="${outputdir}/Achrom_Bchrom.delta"

echo -e "This script was run to index the A and B chromosomes from ${genome} for synteny analysis in RIdeogram.\n\tRun Info: $USER, $DATE\n"

################# List out the chromosomes that I want to index from the genome in samtools:

# These are the names of the chromosomes:

names=( $(cut -f 1 $karyotype | sed 's/>//g') )

A_names=( $(cut -f 1 $karyotype | grep "A" | sed 's/>//g') )

B_names=( $(cut -f 1 $karyotype | grep "B" | sed 's/>//g') )

# This will print out the names:

echo -e "The names of the Chromosomes to be indexed:\n"

for (( counter=0; counter < ${#names[@]}; counter++ ))
do
	echo -e "\t${names[$counter]}"
done

# This will create a list of the A names to input into samtools faidx

A_index=()
for (( counter=0; counter < ${#A_names[@]}; counter++ ))
do
	chrom=${A_names[$counter]}

done

# This will create a list of the B names to input into samtools faidx

B_index=()
for (( counter=0; counter < ${#B_names[@]}; counter++ ))
do
	chrom=${names[$counter]}

done

echo -e "\nThe A Chromosomes are:\n\t${A_names[@]}\n\nThe B Chromosomes are:\n\t${B_names[@]}"

################# Now index out the chromosomes

#echo -e "\n\nSAMTOOLS>>> Indexing out the A chromosomes..\n\n"

#cmd1="samtools faidx ${genome} ${A_names[@]} -o ${outputdir}/SalTr_Ref_A_chroms.fasta"

#echo -e "${cmd1}"

#$cmd1

#echo -e "\n\nSAMTOOLS>>> ..done with A chromosomes.\n\nStarting B chromosomes..\n\n"

#cmd2="samtools faidx ${genome} ${B_names[@]} -o ${outputdir}/SalTr_Ref_B_chroms.fasta" 

#echo -e "${cmd2}"

#$cmd2

#echo -e "\n\nSAMTOOLS>>> ..done with B chromosomes.\n\nIndexes can be found in:\t${outputdir}\n\n"

############### Now run the synteny analysis with minimap:

#echo -e "\n\nminimap2>>> Running Synteny analysis on the indexed chromosomes..\n\n"

#cmd3="minimap2 -I 12G -t 8 -c -o ${outputdir}/Achrom_Bchrom.paf -f 0.02 ${A_chroms} ${B_chroms}"

#echo -e "${cmd3}"

#$cmd3

#echo -e "\n\nminimap2>>> ..finished.\n\n"

############## Exchange paf for delta

echo -e "\n\nragtag.py>>> Converting paf to delta..\n\n"

cmd4="ragtag.py paf2delta ${synteny_out} > ${outputdir}/Achrom_Bchrom.delta"

echo -e "${cmd4}"

$cmd4

echo -e "\n\nragtag.py>>> ..done.\n\n"

############ Conver delta to coords

echo -e "\n\nmummer>>> Converting delta to coords..\n\n"

cmd5="show-coords -lTH -I 90,90,5000 ${ragtag_out} > ${outputdir}/Achrom_Bchrom.coords"

echo -e "${cmd5}"

$cmd5

echo -e "\n\nmummer>>> ..done.\n\n\tExiting Software..\n\n"



