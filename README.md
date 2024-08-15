# _Salsola tragus_ Genome Report

# Overview

This repository includes scripts and files generated during the analysis of the _Salsola tragus_ reference genome and serves as a supplimental resource to the publication titled "Assembly and Annotation of the Tetraploid )_Salsola tragus_ (Russian thistle) Genome". 

## Assembly Statistics 

The reference assemblies for Haplome 1 and Haplome 2 were analyzed using [Assembleathon](https://github.com/KorfLab/Assemblathon/blob/master/assemblathon_stats.pl) (Pearl v5.34.1). 

## Assembly subgenome phasing visualization

Subgenome phasing visualization for Haplome 1 and Haplome 2 were performed using [SubPhaser](https://github.com/zhangrengang/SubPhaser) (v1.2.6). 

## Subgenome synteny analysis

Visualization of synteny between the A and B subgenomes in Haplome 1 was performed using `samtools` (v1.16.1), `minimap2` (v2.24), `ragtag` (v2.1.0), and `showcoords` (mummer, v3.23) in the pipeline `A_vs_B.sh`. the output `.coords` file was rearanged in Microsoft Excel for use in [RIdeogram](https://github.com/TickingClock1992/RIdeogram) (v0.2.2). 

