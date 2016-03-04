#!/bin/bash

fname=$1

bgzip -f $fname
tabix -p vcf $fname.gz
