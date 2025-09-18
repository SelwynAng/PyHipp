#!/bin/bash
# Submit with: sbatch freq-redo-slurm.sh

#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH -J "freqredo"
#SBATCH -o freqredo.%N.%j.out
#SBATCH -e freqredo.%N.%j.err

# Low-frequency spectrum (redo)
python -u -c "import PyHipp as pyh; \
pyh.FreqSpectrum(saveLevel=1,redoLevel=1);"

aws sns publish --topic-arn arn:aws:sns:ap-southeast-1:281053916345:awsnotify --message "redojobDone"
