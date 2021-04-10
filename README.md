# conservationLandscape

This repository host a pipeline to generate a conservation landscape based on the frequency of reference kmers across a set of target genomes. This pipeline has been applied to select regions suitabe for PCR design. 

## RATIONALE

A reference genome is splitted into subsequences of size k (kmer). The frequency of each reference kmer across a set of target genomes is obtained. The conservation landscape is the graphical representation of such frequency map. 

Frequent mutations produce sharp drops in frequency while highly conserved regions are seen as steady high frequency regions.


## INSTALLATION

### DEPENDENCIES

Before running this pipeline, you must have installed and avaiable in your $PATH the following dependencies:

 - jellyfish v2.3 [https://github.com/gmarcais/Jellyfish/tree/master/doc]
 - nextflow [https://www.nextflow.io/]
 - R software [https://www.r-project.org/]
 - kmer_cov_plot. This script is part of the AMOS insfrastructure [http://amos.sourceforge.net/wiki/index.php/AMOS_Getting_Started]. The installaion of this tool can be cumbersome. We include some usefult tips on the file AMOS_instalation.md


### HOW TO INSTALL THIS PIPELINE

1. Clone this repository
2. Move to the repository directory

3. Execute the example command line:

````
nextflow run landscape.nf --input data/sequences.fasta --db ref/MN908947.3.coronavirus.Wuhan-1.fasta --out results/ --kmer 20 --pipeline $PATH_TO_REPO
````

You should see a folder results that contains a counts file and a conservation landscape plot similar to this one.


### HOW TO RUN THIS PIPELINE

#### REQUIRED ARGUMENTS

| Argument  | Description |
| ------------- | ------------- |
| --input  | The path to the input FASTA file  |
| --db | The path to the reference genome FASTA file  |
| --out | The path to the output directory |
| --db | The size of the kmer to be analyzed  |
| --pipeline | The path to the repository directory  |


#### OPTIONAL ARGUMENTS

| Argument  | Description |
| ------------- | ------------- |
| --s  | The size of the hash stored in memory by Jellyfish (DEFAULT:100M) |
| --t | Number of threads used by Jellyfish (DEFAULT:1)  |


### OUTPUT

The output directory will contain two files:
 - kmer_frequency.txt. This is a text file with the frequency information per each reference kmer. Column 1: Start position of reference kmer. Column 2: Frequency of reference kmer. Column 3: Frequency of reference kmer, only forward strand. Column 3: Frequency of reference kmer, only reverse strand. 
 - conservationLandscape.pdf. The graphical display of the conservation landscape. The X-axis represent the start position of each reference kmer and the Y-axis represent its frequency.

![](https://github.com/INMEGEN/conservationLandscape/blob/main/img/covland.png =100x100)



## HOW TO CITE THIS PIPELINE

If you use this pipeline as part of your work, please cite:


