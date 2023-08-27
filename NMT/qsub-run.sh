#!/bin/bash -v

cd ~/experiment/unsup/UnsupervisedMT/NMT

qsub -l 'hostname=c*,gpu=1,mem_free=20G,ram_free=20G' -cwd \
   -o `pwd`/qsub/run.`date +"%Y-%m-%d.%H-%M-%S"`.out \
   -e `pwd`/qsub/run.`date +"%Y-%m-%d.%H-%M-%S"`.err \
   -q g.q ./run.sh
