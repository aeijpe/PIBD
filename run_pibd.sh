#!/bin/bash
#SBATCH --job-name=run_pibd            # Job name
#SBATCH --partition=gpu                # Partition name (queue)
#SBATCH --cpus-per-task=2              # Number of CPU cores per task
#SBATCH --gres=gpu:1                   # Number of GPUs per node
#SBATCH --time=12:00:00                # Time limit in HH:MM:SS
#SBATCH --mem=200G                     # Total memory per node
#SBATCH --output=jobs/slurm_%j.log      # Total memory per node

# Start interactive bash session
source /hpc/uu_inf_aidsaitfl/miniconda3/bin/activate mmp
cd /hpc/uu_inf_aidsaitfl/a_eijpe/PIBD/

# PIBD SETTINGS
# python main.py --study tcga_brca --task survival --seed 1 --data_root_dir ../data/tcga_brca/wsi/extracted_res0_5_patch256_uni/feats_pt --label_dir ../data/tcga_brca/splits/ --omics_dir ../data/tcga_brca/rna/hallmarks/BRCA/rna_clean_norm.csv --results_dir results/rna_clean/tcga_brca
# # MMP SETTINGS
# python main.py --study tcga_brca --task survival --seed 1 --data_root_dir ../data/tcga_brca/wsi/extracted_res0_5_patch256_uni/feats_pt --label_dir ../data/tcga_brca/splits/ --omics_dir ../data/tcga_brca/rna/hallmarks/BRCA/rna_clean_norm.csv --results_dir results/rna_clean/tcga_brca --reg 0.00001 --lr 0.0001 --max_epochs 20 --opt adamW

# RNA PAN
# PIBD SETTINGS
python main.py --study tcga_brca --task survival --seed 1 --data_root_dir ../data/tcga_brca/wsi/extracted_res0_5_patch256_uni/feats_pt --label_dir ../data/tcga_brca/splits/ --omics_dir ../data/tcga_brca/rna/hallmarks/BRCA/rna_clean_pan.csv --results_dir results/rna_clean_pan/tcga_brca
# # MMP SETTINGS
# python main.py --study tcga_brca --task survival --seed 1 --data_root_dir ../data/tcga_brca/wsi/extracted_res0_5_patch256_uni/feats_pt --label_dir ../data/tcga_brca/splits/ --omics_dir ../data/tcga_brca/rna/hallmarks/BRCA/rna_clean_pan.csv --results_dir results/rna_clean_pan/tcga_brca --reg 0.00001 --lr 0.0001 --max_epochs 20 --opt adamW
