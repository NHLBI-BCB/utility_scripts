# utility_scripts
A collection of useful (mostly bash) scripts 

* **vcf_to_sites.sh** : Convert a VCF with individual genotypes to one with only site information. Extracts the first 8 columns of the VCF.
* **vcf_to_bed.sh** : Convert sites in a VCF file to a BED file. For SNPs only, changes site at location X to BED interval (X-1,X).
* **tped_to_bgl.sh** : Convert a PLINK TPED file to a BEAGLE input file.
