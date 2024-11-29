#!/bin/bash

STUDY=$0 # like tcga_brca
OMICS_TYPE=$1
COHORT=$2

WSI_DATA_DIR="../MMP/src/data_wsi/${STUDY}"
RESULTS_DIR="results/${OMICS_TYPE}/" # where is the results stored?

python main.py --study ${STUDY} --task survival --seed 1 \
      --data_root_dir "$WSI_DATA_DIR/extracted_res0_5_patch256_uni/feats_pt" \
      --label_dir "../data/$STUDY/splits/" \
      --omics_file "../MMP/src/data_csvs/rna/hallmarks/${cohort}/${OMICS_TYPE}.csv" --results_dir "$RESULTS_DIR/$STUDY" \
  
