#!/bin/bash
if [ $# -lt 2 ]
then
	echo "Usage:./vcf_to_bed.sh <vcf|vcf.gz> <output-bedfile>"
	exit 1
fi
fname=$1
oname=$2
ext=`echo $fname | awk -v FS='.' '{print $NF}' `
if [ $ext == "gz" ]
then
	cmd="zcat $fname"
elif [ $ext == "vcf" ]
then
	cmd="cat $fname"
else
	echo "bad filename $fname - only .vcf or .vcf.gz files accepted"
	exit 1
fi
cmd="$cmd | grep -v '#' | awk -v OFS='\t' '{print \$1,\$2-1,\$2}'"
cmd="$cmd > $oname"
echo $cmd
eval $cmd
