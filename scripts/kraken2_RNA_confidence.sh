#!/bin/bash
#SBATCH --job-name=kraken2_RNA_conf
#SBATCH --partition=general
#SBATCH --time=02:00:00
#SBATCH --mem=100G
#SBATCH --cpus-per-task=4
#SBATCH --output=logs/kraken2_RNA_conf_%j.out
#SBATCH --error=logs/kraken2_RNA_conf_%j.err

# Stop if a command fails
set -euo pipefail

# Load Kraken2
module load kraken2/2.1.2

# Classify paired-end RNA-seq reads with confidence threshold 0.1
kraken2 \
  --db "$KRAKEN2_DEFAULT_DB" \
  --paired \
  --confidence 0.1 \
  --threads 4 \
  --report results/kraken2_RNA_confidence01_report.txt \
  --output results/kraken2_RNA_confidence01_output.txt \
  data/trimmed/SRR40293353_1.clean.fastq \
  data/trimmed/SRR40293353_2.clean.fastq
