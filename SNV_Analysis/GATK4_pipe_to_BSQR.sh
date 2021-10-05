#!/bin/bash

#with the autosomal.interval_list 

DIR=$1
SAMPLE=$2
SPLITDIR='/Sinto_Split_BAMs' #location of KMeans split BAMs
GATK='/GATK/gatk-4.1.8.1/' #location of GATK
KNOWN='/Known_Sites' #location of Known sites file directory
ASSEMBLY='/assembly' #location of assembly

echo "${DIR} ${SAMPLE} START"

echo "${SAMPLE} RG"
"$GATK/gatk" AddOrReplaceReadGroups -I "$SPLITDIR"/${DIR}/${SAMPLE}.bam \
-O "$SPLITDIR"/${DIR}_intermediate/${SAMPLE}.rg.bam -ID ${SAMPLE} -LB trancriptome -PL ILLUMINA -PU machine -SM ${SAMPLE}

echo "${SAMPLE} INDEX"
samtools index "$SPLITDIR"/${DIR}_intermediate/${SAMPLE}.rg.bam

echo "${SAMPLE} MD"
"$GATK/gatk" MarkDuplicates -I "$SPLITDIR"/${DIR}_intermediate/${SAMPLE}.rg.bam -O "$SPLITDIR"/${DIR}_intermediate/${SAMPLE}.rg.dedup.bam -METRICS_FILE "$SPLITDIR"/${DIR}_intermediate/${SAMPLE}.rg.dedup.bam.metrics.txt -PG  MarkDuplicates -PG_VERSION null -PG_NAME MarkDuplicates

rm "$SPLITDIR"/${DIR}_intermediate/${SAMPLE}.rg.bam

echo "${SAMPLE} SPLIT"
"$GATK/gatk" SplitNCigarReads -R "$ASSEMBLY"/Homo_sapiens.GRCh38.dna.primary_assembly.p7.fa \
-I "$SPLITDIR"/${DIR}_intermediate/${SAMPLE}.rg.dedup.bam -O "$SPLITDIR"/${DIR}_intermediate/${SAMPLE}.rg.dedup.split.bam

rm "$SPLITDIR"/${DIR}_intermediate/${SAMPLE}.rg.dedup.bam

echo "${SAMPLE} BQSR"
"$GATK/gatk" BaseRecalibrator -R "$ASSEMBLY"/Homo_sapiens.GRCh38.dna.primary_assembly.p7.fa \
--known-sites "$KNOWN"/Homo_sapiens_assembly38.dbsnp138.noChr.vcf \
--known-sites "$KNOWN"/Mills_and_1000G_gold_standard.indels.hg38.noChr.vcf \
-I "$SPLITDIR"/${DIR}_intermediate/${SAMPLE}.rg.dedup.split.bam -O "$SPLITDIR"/${DIR}_intermediate/${SAMPLE}.rg.dedup.split.recal.table

echo "${SAMPLE} Apply BQSR"

"$GATK/gatk" ApplyBQSR \
-R "$ASSEMBLY"/Homo_sapiens.GRCh38.dna.primary_assembly.p7.fa \
-I "$SPLITDIR"/${DIR}_intermediate/${SAMPLE}.rg.dedup.split.bam \
--bqsr-recal-file "$SPLITDIR"/${DIR}_intermediate/${SAMPLE}.rg.dedup.split.recal.table \
-O "$SPLITDIR"/${DIR}_intermediate/${SAMPLE}.rg.dedup.split.bqsr.bam

echo "${SAMPLE} INDEX again"
samtools index "$SPLITDIR"/${DIR}_intermediate/${SAMPLE}.rg.dedup.split.bqsr.bam

rm "$SPLITDIR"/${DIR}_intermediate/${SAMPLE}.rg.dedup.split.bam

echo "${SAMPLE} DONE"

exit 0