#!/bin/bash

#SBATCH --job-name=3dmhd_opt         # Job name
#SBATCH --output=3dmhd_output_opt1.log    # Output file name
#SBATCH --error=3dmhd_error.log      # Error output file name
#SBATCH --mem=80GB                   # Request 80GB of memory
#SBATCH --nodes=2                    # Number of nodes
#SBATCH --ntasks-per-node=24         # Number of tasks (processes) per node. Adjust if needed.
#SBATCH --time=01:00:00              # Walltime (HH:MM:SS)

# Run the job
mpirun -np 24 ./3dmhd.exe
