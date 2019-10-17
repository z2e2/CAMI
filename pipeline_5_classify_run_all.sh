#!/bin/bash
. /etc/profile.d/modules.sh

module load shared
module load proteus
module load sge/univa

filename=$(cat file_init.txt)
gunzip $filename
FILE=${filename%.*}

echo $FILE > file.txt
total=$(cat $FILE | wc -l)
echo $total > total.txt
jobnum=$(( total / 800000 + 1))

wid=$( qsub -terse -t 1:$jobnum:1 pipeline_5_classify.sh | cut -f1 -d. )
qsub -terse -hold_jid $wid pipeline_6_extract_results.sh
echo $wid
