#!/bin/bash

BAMPATH='target bam location'
BCPATH='.txt converted barcode location'

sinto filterbarcodes -b "$BAMPATH/Example_library_0.sortedByCoord.out.filtered.bam" -c "$BCPATH/Example_library_0_bc.txt" -p=4 &
sinto filterbarcodes -b "$BAMPATH/Example_library_1.sortedByCoord.out.filtered.bam" -c "$BCPATH/Example_library_1_bc.txt" -p=4 &