#!/bin/bash
#
### tell SGE to use bash for this script
#$ -S /bin/bash
### execute the job from the current working directory, i.e. the directory in which the qsub command is given
#$ -cwd
### join both stdout and stderr into the same file
#$ -j y
### set email address for sending job status
#$ -M zz374@drexel.edu
### project - basically, your research group name with "Grp" replaced by "Prj"
#$ -P rosenPrj
### select parallel environment, and number of job slots
#$ -pe shm 32
### request 15 min of wall clock time "h_rt" = "hard real time" (format is HH:MM:SS, or integer seconds)
#$ -l h_rt=48:00:00
### a hard limit 16 GB of memory per slot - if the job grows beyond this, the job is killed
#$ -l h_vmem=3.5G
### want nodes with at least 15 GB of free memory per slot
#$ -l m_mem_free=3G
### select the queue all.q, using hostgroup @intelhosts
#$ -q all.q

. /etc/profile.d/modules.sh

### These four modules must ALWAYS be loaded
module load shared
module load proteus
module load sge/univa
module load gcc

module load boost/openmpi/gcc/64/1.57.0
CORE_NUM=32
KSIZE=$(cat kmer.txt)
OUTPUT=/lustre/scratch/zz374/model_$KSIZE
CODE=$(pwd)/nb-train-batch.bash
start=`date +%s`
$CODE genomes $OUTPUT $KSIZE $(($CORE_NUM - 1))
end=`date +%s`
runtime=$((end-start))
echo "training time is $runtime"
