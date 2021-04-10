#!/usr/bin/env nextflow
 
/*
*params.input = "data/sequences.fasta"
*params.db = "ref/MN908947.3.coronavirus.Wuhan-1.fasta"
*params.out = "results/"
*params.kmer = 20
*/

/* INPUT PARAMETERS
*
*/
db = file(params.db)
input_file = file(params.input)


/* JELLYFISH PARAMETERS
*
*/
params.s = "DEF"
hash_value = params.s

params.t = "DEF"
threads_value = params.t


/* PLOTTIN SCRIPT
*
*/
path_r = params.pipeline
plotR = "${path_r}/bin/plot_landscape.R"


fasta_datasets = Channel.fromPath(input_file)

/*
 * Run jellyfish 
 */
process countKmers {
 
    input:
    file fasta_file from fasta_datasets
    val hash from hash_value
    val threads from threads_value

    output:
    file 'count_file'  into counts
 
    script:
    def s = hash != "DEF" ? "-s $hash" : '-s 1M'
    def t = hash != "DEF" ? "-t $threads" : ''
    """
        jellyfish count --mer ${params.kmer} $s $t --both-strands --output db $fasta_file
	jellyfish dump db_0 > count_file
    """
}


/*
 * Run kmer_cov_plot 
 */

process cov_plot{
    publishDir params.out, overwrite:true, mode:'copy'
    
    input:
    file count_file from counts

    output:
    file "kmer_frequency.txt"  into cov

    script:
    """
        kmer-cov-plot $count_file < $db > kmer_frequency.txt
    """

}

/*
 * Plot landscape
 */

process plot{
    publishDir params.out, overwrite:true, mode:'move'

    input:
    file cov_file from cov

    output:
    file "conservationLandscape.pdf"  into output

    script:
    """
        Rscript $plotR $cov_file "conservationLandscape.pdf"
    """

}

output.subscribe { println it } 
 
