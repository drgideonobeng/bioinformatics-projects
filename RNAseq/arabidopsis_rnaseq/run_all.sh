#!/usr/bin/env bash
set -euo pipefail

echo "STARTING FULL ARABIDOPSIS RNA-SEQ PIPELINE"
date

# Run scripts in order
./scripts/01_get_data.sh
./scripts/02_index.sh
# ./scripts/03_quant.sh (We will build this next)

echo "PIPELINE COMPLETE"
date
