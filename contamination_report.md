# Contamination Detection in DNA and RNA-seq Datasets

## Methods

For this assignment, I selected two public sequencing datasets: DNA whole-genome sequencing (WGS) from *Ixodes scapularis* (ERR17370123) and RNA-seq from *Aedes aegypti* (SRR40293353). I used the first 10,000 read pairs from each dataset to investigate possible contamination.

I used FastQC to check the quality of the reads and Cutadapt to remove adapters and filter short reads from the RNA-seq data. For contamination detection, I used Kraken2 to classify reads and Bowtie2 to align them to reference genomes. I also used SAMtools to calculate coverage and sequencing depth.

## Results

For the DNA dataset, approximately 0.21% of the reads aligned to the *Rickettsia tamurae* subsp. *buchneri* reference genome. However, the breadth of coverage was only 0.3793%, and the average depth was 0.003902×. These results suggest that some bacterial sequences may be present, but the coverage was too low to confirm their identity.

For the RNA-seq dataset, 8,158 read pairs remained after filtering. Kraken2 classified 329 pairs (4.03%) as bacteria and 214 pairs (2.62%) as human. When I increased the confidence threshold to 0.1, these numbers decreased to 90 bacterial pairs (1.10%) and 82 human pairs (1.01%).

I also investigated *Stenotrophomonas maltophilia*, which was identified in five read pairs by Kraken2. However, I could not confirm this result using Bowtie2 alignment to the bacterial reference genome. For the human-classified reads, 75 out of 82 pairs also aligned to the *Aedes aegypti* genome.

## Discussion

In the DNA dataset, the *Rickettsia* sequences could be related to bacteria naturally associated with ticks. However, because only a small portion of the bacterial genome was covered, I cannot confirm that this species was present.

For the RNA-seq dataset, the bacterial sequences could come from microorganisms associated with the mosquito, the environment, or contamination during sample preparation. The human-classified reads were also difficult to interpret because most of them aligned to the mosquito reference genome.

One important limitation is that I analyzed only 10,000 read pairs from each dataset, rather than the complete sequencing data. Therefore, the percentages may not represent the entire datasets.

Overall, this analysis showed me that identifying unexpected sequences does not necessarily mean that a sample is contaminated. It is important to check the alignment results and genome coverage before making conclusions about the possible source of these sequences.
