if ("BiocManager" %in% installed.packages()){
  install.packages("BiocManager")
}
BiocManager::install("limma")
BiocManager::install("edgeR")
library(limma)
library(edgeR)

load(file.path("data","Yoruba.RData"))


measurements<-y$count
gene_id <- rownames(measurements)
row_id <- 1:nrow(measurements)
measurements<- cbind(row_id, gene_id, measurements)
write.table(measurements, file = file.path("data", "yoruba_data.tsv"), sep="\t", quote=FALSE, row.names = FALSE)

gene_annot<-y$genes
gene_id <- rownames(gene_annot)
row_id <- 1:nrow(gene_annot)
gene_annot <- cbind(row_id, gene_id, gene_annot)
write.table(gene_annot, file = file.path("data", "yoruba_gene_annot.tsv"), sep="\t", quote=FALSE, row.names = FALSE)

sample_annot<-y$samples
sample_name <- rownames(sample_annot)
row_id <- 1:nrow(sample_annot)
sample_annot <- cbind(row_id, sample_name, sample_annot)

write.table(sample_annot, file= file.path("data", "yoruba_sample_annot.tsv"), sep="\t", quote=FALSE, row.names = FALSE)
