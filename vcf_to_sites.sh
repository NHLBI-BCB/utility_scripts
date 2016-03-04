#!/bin/bash
if [ $# -lt 1 ]
then
	echo "Usage:./vcf_to_bed.sh <vcf|vcf.gz>"
	exit 1
fi
fname=$1
dname=`dirname $fname`
ext=`echo $fname | awk -v FS='.' '{print $NF}' `
if [ $ext == "gz" ]
then
	pref=`basename $fname .vcf.gz`
	cmd="zcat $fname"
elif [ $ext == "vcf" ]
then
	pref=`basename $fname .vcf`
	cmd="cat $fname"
else
	echo "bad filename $fname - only .vcf or .vcf.gz files accepted"
	exit 1
fi
oname="$dname/$pref.sites.vcf"
cmd="$cmd | cut -f1-8"
cmd="$cmd > $oname"
echo $cmd
eval $cmd
