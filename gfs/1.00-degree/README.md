# GFS 1.00 Degree

Installation instructions for this setup on Perlmutter
(note: Perlmutter specifics only pertain to the first and last lines).

```
module load gcc cudnn nccl cray-mpich
conda env create -f environment.yaml
conda activate eagle
pip install 'flash-attn<2.8' --no-build-isolation
MPICC="cc -shared" pip install --force --no-cache-dir --no-binary=mpi4py mpi4py
```
