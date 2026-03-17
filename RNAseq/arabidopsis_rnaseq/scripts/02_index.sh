#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../config.sh"

echo "-------------------------------------------------------"
echo "RUNNING STEP 02: DECOY-AWARE INDEXING"
echo "-------------------------------------------------------"

# 1. Create Decoy list
echo "Generating decoys from $GENOME..."
grep "^>" <(gunzip -c "$GENOME") | cut -d " " -f 1 > "$REF_DIR/decoys.txt"
sed -i.bak -e 's/>//g' "$REF_DIR/decoys.txt"

# 2. Create Gentrome
echo "Combining transcriptome and genome..."
cat "$TRANSCRIPTOME" <(gunzip -c "$GENOME") > "$REF_DIR/gentrome.fa"

# 3. Salmon Indexing
echo "Starting Salmon Indexing with $THREADS threads..."
salmon index \
    -t "$REF_DIR/gentrome.fa" \
    -d "$REF_DIR/decoys.txt" \
    -p "$THREADS" \
    -i "$INDEX_DIR"

# Clean up the large unzipped gentrome to save space
rm "$REF_DIR/gentrome.fa"

echo "Indexing Complete: $INDEX_DIR"
