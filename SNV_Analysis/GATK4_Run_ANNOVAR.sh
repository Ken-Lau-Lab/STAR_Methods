#!/bin/bash

BAMPATH='/Sinto_Split_BAMs' #location of KMeans split BAMs
GVCFPATH='/VCFs' #location of joint GVCFs
GATK='/GATK/gatk-4.1.8.1/' #location of GATK
ASSEMBLY='/assembly' #location of assembly

DIR=$1

perl table_annovar.pl "$GVCFPATH"/${DIR}_Split_KMeans20.GVCFs.jointcalls.g.vcf humandb/ -buildver hg38 -out "$GVCFPATH"/${DIR}_Split_KMeans20_avsnp -vcfinput -remove -protocol refGene,avsnp150 -operation g,f -nastring . -polish