#!/bin/bash
#SBATCH --job-name=aedes-RNA
#SBATCH --partition=general
#SBATCH --time=02:00:00
#SBATCH --mem=16G
#SBATCH --cpus-per-task=4
#SBATCH --output=logs/aedes_RNA_%j.out
#SBATCH --error=logs/aedes_RNA_%j.err

set -euo pipefail

module load gcc/9.3.0
module load bowtie2/2.4.2

bowtie2 --local -p 4 \
  -x references/aedes/AaegL5_index \
  -1 data/trimmed/SRR40293353_1.clean.fastq \
  -2 data/trimmed/SRR40293353_2.clean.fastq \
  -S results/aedes_RNA.sam \
  2> logs/aedes_RNA_alignment.log
