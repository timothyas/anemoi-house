# Reduced Gaussian Grid Latent Mesh
## Training and Inference


```
anemoi-datasets==0.5.26
anemoi-core ... commit=5dd32ca1 + feature/aml
* training-0.5.1+
* models-0.8.1+
* graphs-0.6.2+
anemoi-inference = d9efac5 ... 0.6.3+
anemoi-utils ... fdf0fc8 ... 0.4.28+
anemoi-transform==0.1.13
```

```
srun --jobid $SLURM_JOB_ID ~/anemoi-house/slurm2ddp.sh anemoi-training train --config-name=config
```
