#!/bin/bash
 
prefix=$1
outfile=$2
 
header="I id"
inds=`cat ${prefix}.tfam | awk '{print $2 " " $2}' `   
header="$header $inds"
 
echo $header > $outfile
cat ${prefix}.tped | awk '{$1="M";$3="";$4="";print $0}'>> $outfile
