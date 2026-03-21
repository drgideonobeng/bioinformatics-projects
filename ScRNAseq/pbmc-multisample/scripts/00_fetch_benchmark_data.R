# scripts/00_fetch_benchmark_data.R
library(Seurat)
library(Matrix)
library(SeuratData)

message("Loading the Kang 'ifnb' dataset...")
data("ifnb")

message("Updating object to match your modern Seurat version...")
ifnb <- UpdateSeuratObject(ifnb)

message("Extracting raw count matrices (the Seurat v5 way!)...")
# CHANGED: We are now using 'layer' instead of 'slot'!
counts <- GetAssayData(ifnb, assay = "RNA", layer = "counts")

# Split the cell barcodes into Untreated (CTRL) and Stimulated (STIM)
ctrl_barcodes <- rownames(ifnb@meta.data[ifnb@meta.data$stim == "CTRL", ])
stim_barcodes <- rownames(ifnb@meta.data[ifnb@meta.data$stim == "STIM", ])

ctrl_counts <- counts[, ctrl_barcodes]
stim_counts <- counts[, stim_barcodes]

message("Formatting and writing raw 10x matrices to your folders...")

write_10x <- function(mat, out_dir) {
  dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
  writeMM(mat, file = file.path(out_dir, "matrix.mtx"))
  write.table(data.frame(rownames(mat), rownames(mat), "Gene Expression"), 
              file = file.path(out_dir, "features.tsv"), 
              row.names = FALSE, col.names = FALSE, quote = FALSE, sep = "\t")
  write.table(colnames(mat), file = file.path(out_dir, "barcodes.tsv"), 
              row.names = FALSE, col.names = FALSE, quote = FALSE)
}

write_10x(ctrl_counts, "data/untreated")
write_10x(stim_counts, "data/treated")

message("Success! Your data folders are primed and ready for the pipeline.")
