#!/usr/bin/env bash

# This identifies the directory where config.sh itself lives
export PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Standard Directory structure
export REF_DIR="$PROJECT_DIR/ref"
export DATA_DIR="$PROJECT_DIR/data"
export QUANTS_DIR="$PROJECT_DIR/quants"
export SCRIPTS_DIR="$PROJECT_DIR/scripts"
export INDEX_DIR="$REF_DIR/salmon_index"

# Reference URLs
export TRANSCRIPTOME_URL="ftp://ftp.ensemblgenomes.org/pub/plants/release-58/fasta/arabidopsis_thaliana/cdna/Arabidopsis_thaliana.TAIR10.cdna.all.fa.gz"
export GENOME_URL="ftp://ftp.ensemblgenomes.org/pub/plants/release-58/fasta/arabidopsis_thaliana/dna/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa.gz"

export THREADS=4
export SAMPLE_ID="SRR1560949"
