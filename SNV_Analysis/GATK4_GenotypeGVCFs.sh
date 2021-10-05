#!/bin/bash

BAMPATH='/Sinto_Split_BAMs' #location of KMeans split BAMs
GVCFPATH='/VCFs' #location of joint GVCFs
GATK='/GATK/gatk-4.1.8.1/' #location of GATK
ASSEMBLY='/assembly' #location of assembly

DIR=$1

"$GATK/gatk" GenotypeGVCFs \
-R "$ASSEMBLY"/Homo_sapiens.GRCh38.dna.primary_assembly.p7.fa \
-V gendb://"$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_KMeans20_genomicsdb \
-O "$GVCFPATH"/${DIR}_Split_KMeans20.GVCFs.jointcalls.g.vcf