#!/bin/bash

DIR=$1
SAMPLE=$2
SPLITDIR='/Sinto_Split_BAMs' #location of KMeans split BAMs
GATK='/GATK/gatk-4.1.8.1/' #location of GATK
KNOWN='/Known_Sites' #location of Known sites file directory
ASSEMBLY='/assembly' #location of assembly

echo "${SAMPLE} START"

echo "${SAMPLE} HAPLO"
"$GATK/gatk" HaplotypeCaller -R "$ASSEMBLY"/Homo_sapiens.GRCh38.dna.primary_assembly.p7.fa \
-I "$SPLITDIR"/${DIR}_intermediate/${SAMPLE}.rg.dedup.split.bqsr.bam --native-pair-hmm-threads 4 --dont-use-soft-clipped-bases -ERC GVCF -stand-call-conf 20 \
-L autosomal.interval_list \
-O "$SPLITDIR"/${DIR}_vcf/${SAMPLE}.rg.dedup.split.bqsr.cof20.vcf

echo "${SAMPLE} DONE"

exit 0