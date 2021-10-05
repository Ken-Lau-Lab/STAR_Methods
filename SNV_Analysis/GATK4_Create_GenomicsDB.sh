#!/bin/bash

BAMPATH='/Sinto_Split_BAMs' #location of KMeans split BAMs
GVCFPATH='/VCFs' #location of joint GVCFs
GATK='/GATK/gatk-4.1.8.1/' #location of GATK
ASSEMBLY='/assembly' #location of assembly

DIR=$1

"$GATK/gatk" GenomicsDBImport \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_0.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_1.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_2.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_3.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_4.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_5.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_6.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_7.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_8.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_9.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_10.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_11.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_12.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_13.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_14.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_15.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_16.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_17.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_18.rg.dedup.split.bqsr.cof20.vcf \
-V "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_19.rg.dedup.split.bqsr.cof20.vcf \
--genomicsdb-workspace-path "$BAMPATH"/${DIR}_Split_BAM_vcf/${DIR}_KMeans20_genomicsdb \
--intervals autosomal.interval_list \
--max-num-intervals-to-import-in-parallel 16 \
--reader-threads 64