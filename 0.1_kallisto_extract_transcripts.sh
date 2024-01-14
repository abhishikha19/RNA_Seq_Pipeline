#!/bin/bash

# Raw genome fasta and annotation gtf
FA=/lustre/scratch108/compgen/team218/TA/genomebuilding/Mus_musculus.GRCm38.dna.primary_assembly.fa
GTF=/lustre/scratch108/compgen/team218/TA/genomebuilding/Mus_musculus.GRCm38.79.gtf

# Location for output files
OUTDIR=/lustre/scratch108/compgen/team218/TA/STRIPED_GENOMES

# Locations of required software
GFFREAD=/nfs/users/nfs_t/ta6/RNASeqPipeline/software/cufflinks-2.2.1.Linux_x86_64/gffread
KALLISTO=/nfs/users/nfs_t/ta6/RNASeqPipeline/software/kallisto_linux-v0.42.4/kallisto

# Extract transcriptome fasta using gffread
$GFFREAD $GTF -g $FA -w $OUTDIR/Transcripts.fasta

# Index the extracted transcriptome
$KALLISTO index -i $OUTDIR/kallisto_index.idx $OUTDIR/Transcripts.fasta

