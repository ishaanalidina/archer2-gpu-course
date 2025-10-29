#!/bin/bash

#SBATCH --job-name=dscal
#SBATCH --gpus=1
#SBATCH --time=00:01:00

#SBATCH --partition=gpu
#SBATCH --qos=gpu-shd

# Check assigned GPU
rocm-smi

module load PrgEnv-amd rocm craype-accel-amd-gfx90a craype-x86-milan

srun --ntasks=1 --cpus-per-task=1 ./a.out

exit 0
