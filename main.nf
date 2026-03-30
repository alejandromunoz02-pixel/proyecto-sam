#!/usr/bin/env nextflow

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
