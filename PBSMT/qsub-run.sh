#!/bin/bash -v
. ./local-settings.sh

stage=$1

cd $DIR

qsub -l 'hostname=c*,gpu=1,mem_free=25G,ram_free=25G' -cwd \
   -o `pwd`/qsub/run.`date +"%Y-%m-%d.%H-%M-%S"`.out \
   -e `pwd`/qsub/run.`date +"%Y-%m-%d.%H-%M-%S"`.err \
   -q all.q ./run.sh $stage

