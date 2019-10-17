filename=$1
outputdir=$2
name=${filename%.*}
SAMPLEID=$(echo $name | rev| cut -d"/" -f1 | rev)
output=$outputdir/formatted_$SAMPLEID.txt
cat common_header.txt <(echo "@SampleID:2ndCAMI_$SAMPLEID") > tmp_header.txt
echo "@Ranks:phylum|class|order|family|genus|species" >> tmp_header.txt
echo "" >> tmp_header.txt
cat tmp_header.txt $filename > $output
