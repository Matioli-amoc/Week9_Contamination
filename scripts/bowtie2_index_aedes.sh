#!/bin/bash
#SBATCH --job-name=aedes-index
#SBATCH --partition=general
#SBATCH --time=04:00:00
#SBATCH --mem=32G
#SBATCH --cpus-per-task=4
#SBATCH --output=logs/aedes_index_%j.out
#SBATCH --error=logs/aedes_index_%j.err

set -euo pipefail

module load bowtie2/2.4.2

bowtie2-build --threads 4 \
  references/aedes/GCF_002204515.2_AaegL5.0_genomic.fna \
  references/aedes/AaegL5_index
