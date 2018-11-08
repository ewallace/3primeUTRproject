#!/bin/sh
home_dir=$(pwd)
echo begin_down
date
mkdir background_down
#-dna: specify data in fasta file
#-revcomp: consider reverse complement
#-mod anr: Any Number of Repetitions (a motif might repeats multiple times in one sequence)
#-evt: e-value treashold
#-p 20: paralellise the task to speed things up
#bfile:  background file
#maxw, minw: maximum and minimum width
/usr/local/meme5/bin/meme ./background_down.fasta -dna -revcomp -mod anr -oc $home_dir/background_down -nmotifs 50 -evt 0.005 -brief 1000000 -p 20 -bfile $home_dir/bg_down-model-1 -maxw 10 -minw 6
echo begin_up
date
mkdir background_up
/usr/local/meme5/bin/meme ./background_up.fasta -dna -revcomp -mod anr -oc $home_dir/background_up -nmotifs 50 -evt 0.005 -brief 1000000 -p 20 -bfile $home_dir/bg_down-model-1 -maxw 10 -minw 6
echo finish at:
date

