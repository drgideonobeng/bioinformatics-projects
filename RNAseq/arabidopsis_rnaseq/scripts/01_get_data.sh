#!/usr/bin/env bash
set -euo pipefail

# DYNAMIC PATH LOCATOR: Finds config.sh in the parent directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../config.sh"

echo "-------------------------------------------------------"
echo "RUNNING STEP 01: DATA ACQUISITION"
echo "Project Root: $PROJECT_DIR"
echo "-------------------------------------------------------"

mkdir -p "$REF_DIR" "$DATA_DIR"

wget -N -P "$REF_DIR" "$TRANSCRIPTOME_URL"
wget -N -P "$REF_DIR" "$GENOME_URL"

echo "Success: Reference files located in $REF_DIR"
