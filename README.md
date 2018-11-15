# 3primeUTRproject
R/shell scripts related to 3' UTR project

#  Project body

## **R notebook**
Main source code. They are split into two parts.
* **tablePreparation.Rmd** imports original tables, rearrange, modifies, and processes the table, then clusters gene expression data, perfroms GO-enrichment analyses, retrieves and separates 500bp upstream and downstream sequences into clusters.

* **MotifOperations.Rmd** performs MEME-discovery on clustered sequence files from the previous step, performs MAST (motif site counting) on MEME results, then compares discovered motifs to themselves and databases with TOMTOM. Then, gathers all results into motif table containing motif occurence data and gene expression.

* 3primeRepo.Rproj an Rstudio project file.

## **BASH scripts**
Part of **MotifOperations.Rmd**. Run in shell terminal outside of Rstudio.
* **meme.sh** A motif discovery tool. Finds motifs from input sequences.
* **background_meme.sh** performs MEME discovery on background sequences.
* **mast.sh** A motif site counter. Counts motif sites of input motifs from input sequences.
* **meme2meme.sh** A script for combining multiple meme result files into one file.
* **tomtom.sh** A motif comparison tool. Compares input motifs to input databases.

## **Materials**
**Sequence files** 
* **materials_for_motif_operation.tar.gz** contains clustered sequence files for starting MotifOperations.Rmd.
### backups for previous results reproduction (See: MotifOperations.Rmd at MOTIF TABLES COMPARISON BETWEEN PREVIOUS RUN AND THE CURRENT RUN section in MotifOperations.Rmd)
* background_down_old.fasta: 
* background_up_old.fasta: 
**Tables**
* **materials_for_motif_operation.Rdata** contains required tables for starting MotifOperations.Rmd.

**Motif database** for motif comparison
* GASCH_motif: motifs found from original paper (https://www.ncbi.nlm.nih.gov/pmc/articles/PMC15070/)
* JASPAR2018_CORE_fungi_non-redundant_pfms_meme.txt: Motifs from JASPAR (transcription factor) db
* stab_motif: motifs related to RNA stability from https://genomebiology.biomedcentral.com/articles/10.1186/gb-2005-6-10-r86 motif source:https://webhome.weizmann.ac.il/home/tammyb/Shalgietal2005/
* subloc_motif: motifs related to sub-cellular localisation, same source as above.
