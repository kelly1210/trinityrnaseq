#!/bin/bash -ve


if [ -e reads.right.fq.gz ] && [ ! -e reads.right.fq ]; then
    gunzip -c reads.right.fq.gz > reads.right.fq
fi

if [ -e reads.left.fq.gz ] && [ ! -e reads.left.fq ]; then
    gunzip -c reads.left.fq.gz > reads.left.fq
fi



#######################################################
##  Run Trinity to Generate Transcriptome Assemblies ##
#######################################################

${TRINITY_HOME}/Trinity --seqType fq --max_memory 2G \
              --left reads.left.fq \
              --right reads.right.fq \
              --SS_lib_type RF \
              --CPU 4 \
              --output trinity_with_workdir \
              --workdir  /tmp/trinity.workdir.$$ --full_cleanup


exit 0



