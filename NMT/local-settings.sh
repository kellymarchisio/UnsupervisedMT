#!/bin/sh

# set visible GPU(s)
export GPU=`free-gpu`
export CUDA_VISIBLE_DEVICES=$GPU

export MOSES_PATH=/home/pkoehn/moses

# path to my experimental directory
export DIR=`pwd`
if [ -d /mnt/data ]; then
        export TEMPDIR=/mnt/data/kmarc/tmp
        export tmpdir=$TEMPDIR
        export tmp=$TEMPDIR
	mkdir -p $TEMPDIR
else
        export TEMPDIR=$DIR/tmp
        export tmpdir=$TEMPDIR
        export tmp=$TEMPDIR
fi

## Program Output
echo You are running on machine: `hostname`
echo Here is what free-gpu returned: `free-gpu`
echo GPU is $GPU
echo CUDA_VISIBLE_DEVICES is $CUDA_VISIBLE_DEVICES
