# conservationLandscape

This repository host a pipeline to generate a conservation landscape based on the frequency of reference kmers across a set of target genomes

This pipeline has been applied to select regions suitabe for PCR design. It has been published as part of the work:

"IMPROVED PCR END-POINT BASED ON A POPULATION CONSERVATION LANDSCAPE AS AN ALTERNATIVE DIAGNOSTIC TEST FOR THE SARS-COV-2 VIRUS"


## RATIONALE

A reference genome is splitted into subsequences of size k (kmer). The frequency of each reference kmer across a set of target genomes is obtained. The conservation landscape is the graphical representation of such frequency map. The X-axis represent the start position of each reference kmer and the Y-axis represent its frequency.

Frequent mutations are seen as lines that drop to low values. Highly conserved regions are seen as steady-horizontal lines


## INSTALLATION

### DEPENDENCIES

Before running this pipeline, you must have installed and avaiable in your $PATH
 - jellyfish 
 - kmer_cov_plot
 - R software
 - nextflow

### HOW TO INSTALL THIS PIPELINE

Clone this repository

Move to the repository

Execute the example command line:

````
nextflow run landscape.nf --input data/sequences.fasta --db ref/MN908947.3.coronavirus.Wuhan-1.fasta --out results/ --kmer 20 --pipeline $PATH_TO_REPO
````

You should see a folder results that contains a counts file and a conservation landscape plot similar to this one.

