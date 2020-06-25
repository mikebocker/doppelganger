library(BiocManager)
library(doppelgangR)
library(Biobase)

# Set working directory
setwd("C:/Users/Michael/Desktop/SHEPHERD/Microarray_data")
setwd("./colorectal_cancer")

# Load expression data from GSE26906 and GSE39582
GSE26906_exprs <- read.csv("GSE26906_exprs.csv")
GSE39582_exprs <- read.csv("GSE39582_exprs.csv")

# Create list of type ExpressionSet
GSE26906_eset <- makeExpressionSet(GSE26906_exprs, state = colnames(GSE26906_exprs))
GSE39582_eset <- makeExpressionSet(GSE39582_exprs, state = colnames(GSE39582_exprs))


# Run doppelgangR on datasets
# Expected number of duplicates: 90 (https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5241903/)
testesets <- list(GSE26906_eset, GSE39582_eset)
results <- doppelgangR(testesets, phenoFinder.args=NULL)
