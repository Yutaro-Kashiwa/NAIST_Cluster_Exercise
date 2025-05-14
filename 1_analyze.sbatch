#!/bin/bash

#SBATCH --job-name=ex_naist_cluster
#SBATCH --output=logs/ex_naist_cluster_%A_%a.out
#SBATCH --error=errors/ex_naist_cluster_%A_%a.err
#SBATCH --array=1
#SBATCH --time=4:00:00
#SBATCH --partition=hmem_short
#SBATCH --ntasks=1
#SBATCH --mem=16G
#SBATCH --cpus-per-task=4

mkdir -p errors
mkdir -p logs
module load java
bash ex1/main.sh
#bash ex2/main.sh $SLURM_ARRAY_TASK_ID