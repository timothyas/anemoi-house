#!/bin/bash

#SBATCH -J gfs-residual-stats
#SBATCH -o slurm_residual_stats.%j.out
#SBATCH -e slurm_residual_stats.%j.err
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=128
#SBATCH --cpus-per-task=2
#SBATCH --qos=debug
#SBATCH --account=m4718
#SBATCH --constraint=cpu
#SBATCH -t 00:30:00

conda activate ufs2arco
srun ufs2arco gfs.yaml
