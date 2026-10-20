# Week 9 – Contamination Detection Practical

## Objective
The objective of this assignment was to identify possible contamination in public DNA WGS and RNA-seq datasets and evaluate the evidence using taxonomic classification and reference-based alignment.

## Datasets
- DNA WGS: ERR17370123 – Ixodes scapularis
- RNA-seq: SRR40293353 – Aedes aegypti

I analyzed the first 10,000 paired-end reads from each dataset.

## Tools
- FastQC: sequencing quality control
- Cutadapt: adapter trimming and read filtering
- Kraken2: taxonomic classification
- Bowtie2: alignment to reference genomes
- SAMtools: alignment and coverage statistics

## Results
For the DNA WGS dataset, approximately 0.21% of reads aligned to the Rickettsia reference. The breadth of coverage was 0.3793%, and the mean depth was 0.003902x.

For the RNA-seq dataset, 8,158 read pairs remained after filtering. Using Kraken2 with a confidence threshold of 0.1, 90 pairs were classified as bacteria and 82 as human.

Further alignment did not confirm the Stenotrophomonas maltophilia classification. Also, 75 of the 82 human-classified pairs aligned to the Aedes aegypti reference genome.

These findings were considered possible signals rather than confirmed contamination.

## Project Files
- `contamination_report.md`: one-page report
- `results/contamination_summary.tsv`: detection summary
- `scripts/`: analysis scripts
- `results/`: selected analysis outputs

## Limitations
Only a subset of each dataset was analyzed. Taxonomic classifications may also reflect sequence similarity or naturally associated microorganisms.

## AI Assistance
ChatGPT was used to help plan the workflow, explain commands, troubleshoot errors, and organize the report. Analyses were executed on the Auburn University Easley HPC cluster.
