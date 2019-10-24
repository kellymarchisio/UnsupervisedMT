#!/bin/bash -v

###############################################################################
###
### Kelly's run script for Facebook's Neural Unsupervised Machine Translation
### 	system at https://github.com/facebookresearch/UnsupervisedMT.
###
### This script has been written for use on the JHU CLSP Grid
###	-- Kelly Marchisio, Oct 2019.
###

. ./local-settings.sh

mkdir -p qsub

MONO_DATASET='en:./data/mono/all.en.tok.60000.pth,,;fr:./data/mono/all.fr.tok.60000.pth,,'
PARA_DATASET='en-fr:,./data/para/dev/newstest2013-ref.XX.60000.pth,./data/para/dev/newstest2014-fren-src.XX.60000.pth'
PRETRAINED='./data/mono/all.en-fr.60000.vec'

python main.py \
	--exp_name test --exp_id l9uerzic2x \
	--reload_model='./dumped/test/l9uerzic2x/checkpoint.pth' \
	--transformer True --n_enc_layers 4 --max_len 100 \
	--n_dec_layers 4 --share_enc 3 --share_dec 3 --share_lang_emb True \
	--share_encdec_emb True --share_output_emb True --langs 'en,fr' \
	--n_mono -1 --mono_dataset $MONO_DATASET --para_dataset $PARA_DATASET \
	--mono_directions 'en,fr' --word_shuffle 3 --word_dropout 0.1 \
	--word_blank 0.2 --pivo_directions 'fr-en-fr,en-fr-en' \
	--pretrained_emb $PRETRAINED --pretrained_out True \
	--lambda_xe_mono '0:1,100000:0.1,300000:0' --lambda_xe_otfd 1 \
	--otf_num_processes 30 --otf_sync_params_every 1000 \
	--enc_optimizer adam,lr=0.0001 --epoch_size 500000 \
	--stopping_criterion bleu_en_fr_valid,10 \
	--reload_enc 1 --reload_dec 1 --reload_dis 0

