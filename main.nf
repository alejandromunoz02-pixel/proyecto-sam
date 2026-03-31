






#!/usr/bin/env nextflow
// version=1.0
// INSTRUCTIONS
// main.nf
// description: Nextflow pipeline to run the SAM analysis script
// wraps main.py and handles input as a Nextflow channel
// usage: nextflow run main.nf --sam <path_to_SAM_file>
// input: --sam parameter with path to a SAM file
// output: printed table with alignment statistics
// author: alejandromunoz02-pixel
// date: 2026-03-31#!/usr/bin/env nextflow

params.sam = null

process analyze_sam {
    input:
    path sam_file

    output:
    stdout

    script:
    """
    uv run python ${projectDir}/main.py ${sam_file}
    """
}

workflow {
    if (!params.sam) {
        error "Debes proporcionar un fichero SAM con --sam"
    }

    sam_ch = Channel.fromPath(params.sam)
    analyze_sam(sam_ch) | view
}
