#!/bin/bash

#SBATCH -J 1x16encoders-wxvx
#SBATCH -o slurm/1x16encoders.wxvx.%j.out
#SBATCH -e slurm/1x16encoders.wxvx.%j.err
#SBATCH --nodes=1
#SBATCH --qos=regular
#SBATCH --account=m4718
#SBATCH --constraint=cpu
#SBATCH -t 10:00:00

set -e

experiment=1x16encoders
n_procs=256
n_procs_eagle=16

## Step 1: prewxvx
#echo "Starting prewxvx..."
#conda activate eagle
#srun -n ${n_procs_eagle} eagle-tools prewxvx "${experiment}/prewxvx.validation.yaml"
#conda deactivate
#echo "prewxvx completed successfully."

# Step 2: wxvx (grids and stats)
#echo "Starting wxvx grids..."
conda activate /global/homes/t/timothys/miniforge3/envs/DEV-wxvx
#wxvx -c "${experiment}/wxvx.validation.yaml" -t grids -n ${n_procs} > "${experiment}/log.wxvx.grids.out" 2>&1
#echo "wxvx grids completed successfully."
#
#echo "Rerunning wxvx grids..."
#wxvx -c "${experiment}/wxvx.validation.yaml" -t grids -n ${n_procs} > "${experiment}/log.wxvx.grids.out.2" 2>&1
#echo "wxvx grids completed successfully."

echo "Starting wxvx stats..."
wxvx -c "${experiment}/wxvx.validation.yaml" -t stats -n ${n_procs} > "${experiment}/log.wxvx.stats.out.b" 2>&1
echo "wxvx stats completed successfully."

echo "Rerunning wxvx stats..."
wxvx -c "${experiment}/wxvx.validation.yaml" -t stats -n ${n_procs} > "${experiment}/log.wxvx.stats.out.b.2" 2>&1
echo "wxvx stats completed successfully."

conda deactivate


# Step 3: postwxvx
echo "Starting postwxvx..."
conda activate eagle
eagle-tools postwxvx "${experiment}/postwxvx.validation.yaml" > "eagle-logs/postwxvx/log.${experiment}.out" 2>&1
echo "postwxvx completed successfully."
