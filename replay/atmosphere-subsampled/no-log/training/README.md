# Training

## Versions

These yaml files are compatible with the following versions:

```
pip install anemoi-datasets==0.5.23 anemoi-graphs==0.5.2 anemoi-models==0.5.0 anemoi-training==0.4.0
pip install 'earthkit-data<0.14.0'
```

## Running

To run training, just modify the lines below so that they point to your
anemoi-house repo location.

In an interactive job

```
srun --jobid $SLURM_JOB_ID /path/to/anemoi-house/slurm2ddp.sh anemoi-training train --config-name=config
```

or submit the slurm script

```
sbatch submit_training.sh
```
