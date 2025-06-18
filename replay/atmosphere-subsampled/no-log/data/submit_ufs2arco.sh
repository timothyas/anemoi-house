#!/bin/bash

#SBATCH -J replay-atm-preprocess
#SBATCH -o preprocessing.%j.out
#SBATCH -e preprocessing.%j.err
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=128
#SBATCH --cpus-per-task=2
#SBATCH --qos=regular
#SBATCH --account=m4718
#SBATCH --constraint=cpu
#SBATCH -t 02:00:00

module load conda
conda activate ufs2arco
srun ufs2arco training.yaml --overwrite
srun ufs2arco validation.yaml --overwrite
srun ufs2arco testing.yaml --overwrite
