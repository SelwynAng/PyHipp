#!/bin/bash
# Submit with: sbatch fsall-low-slurm.sh

#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH -J "fsall-low"
#SBATCH -o fsall-low.%N.%j.out
#SBATCH -e fsall-low.%N.%j.err

# Cumulative low-frequency spectrum
python -u -c "import PyHipp as pyh; \
import DataProcessingTools as DPT; \
lfall = DPT.objects.processDirs(dirs=None, exclude=['*eye*','*mountains*'], \
objtype=pyh.FreqSpectrum, saveLevel=1); \
lfall.save();"

aws sns publish --topic-arn arn:aws:sns:ap-southeast-1:281053916345:awsnotify --message "CumlativejobDone"
