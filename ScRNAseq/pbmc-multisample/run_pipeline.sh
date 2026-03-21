#!/bin/bash
# run_pipeline.sh

# Stop execution immediately if any script fails
set -e 

echo "========================================"
echo "🚀 STARTING SINGLE-CELL PIPELINE 🚀"
echo "========================================"

echo "[1/9] Loading Data..."
Rscript scripts/01_load_data.R

echo "[2/9] Running Quality Control..."
Rscript scripts/02_qc.R

echo "[3/9] Normalizing Data..."
Rscript scripts/03_normalize.R

echo "[4/9] Scaling and PCA..."
Rscript scripts/04_scale_and_pca.R

echo "[5/9] Clustering and UMAP..."
Rscript scripts/05_cluster_and_umap.R

echo "[6/9] Finding Biomarkers..."
Rscript scripts/06_find_markers.R

echo "[7/9] Visualizing Markers..."
Rscript scripts/07_visualize_markers.R

echo "[8/9] Annotating Cell Types..."
Rscript scripts/08_annotate_clusters.R

echo "[9/9] Running Condition Comparison (Healthy vs Stimulated)..."
Rscript scripts/09_condition_comparison.R

echo "========================================"
echo "✅ PIPELINE COMPLETE! Check the results/ folder."
echo "========================================"
