#!/usr/bin/env bash
#SBATCH --partition=unkillable  # unkillable:1GPU,6CPUs,mem=32G,2days | main:2GPUs,8CPUs,mem=48G,2days | long:(nolimit),7days
#SBATCH --gres=gpu:v100:1
#SBATCH --mem=32G
#SBATCH --time=48:00:00
#SBATCH --exclude=kepler2
#SBATCH -o /miniscratch/singhals/slurm-logs/dwd/pre_%j  # Write the log on tmp1

echo "running on $SLURMD_NODENAME"
export PYTHONUNBUFFERED=1

module load miniconda/3;module load cuda/10.1/cudnn/7.6;conda activate dialog
cd ~/research/dialog_without_dialog/data
MYPYTHON_PATH=`which python`
echo "Activate my env, curr python ${MYPYTHON_PATH}"

# Unzip data
#echo "Unzipping data..."
#ln -s $SLURM_TMPDIR/localscratch ~/research/dialog_without_dialog/data
#unzip /miniscratch/luyuchen/compressed.zip -d $SLURM_TMPDIR/localscratch

#echo "data unzipping done"
exec $@
#cp -r ~/research/dialog_without_dialog/data/experiments/ ~/research/dialog_without_dialog/data_orig/
