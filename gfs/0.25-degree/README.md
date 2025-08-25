# 1/4 Degree GFS

## For now, no transfer learning

Training from scratch

## Transfer Learning Training Schedule

Create 1 degree without trainable features, then...

Baseline:
1. 200 epochs on 1 degree data
2. 100 epochs on 1/4 degree data

Future: consider modifying step 2 to split between training on the whole period
and then fine tuning on most recent model version.
