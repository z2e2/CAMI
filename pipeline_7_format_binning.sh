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
#$ -pe shm 1
### request 15 min of wall clock time "h_rt" = "hard real time" (format is HH:MM:SS, or integer seconds)
#$ -l h_rt=48:00:00
### a hard limit 16 GB of memory per slot - if the job grows beyond this, the job is killed
#$ -l h_vmem=8G
### want nodes with at least 15 GB of free memory per slot
#$ -l m_mem_free=6G
### select the queue all.q, using hostgroup @intelhosts
#$ -q all.q

. /etc/profile.d/modules.sh

### These four modules must ALWAYS be loaded
module load shared
module load proteus
module load sge/univa
module load gcc

start=`date +%s`
input=/mnt/HA/groups/rosenGrp/zz374/CAMI/results
output=/mnt/HA/groups/rosenGrp/zz374/CAMI/formatted/
for filename in $input/*.txt; do
bash format_binning.sh $filename $output
done
end=`date +%s`
runtime=$((end-start))
echo "formatting time is $runtime"
