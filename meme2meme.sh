#!/bin/sh
echo begin
date
#choose directory
dir_list=$(ls -d cluster_18/)
echo $dir_list
#loop for a folder of each clustering
for dir in $dir_list
do
home_dir=$(pwd)
cd "$home_dir/$dir"
echo current directory:
pwd
echo merge upstream_motifs
meme_up=$(find $home_dir/$dir -path '*up/meme.html'| sort)
echo $meme_list
/usr/local/meme5/libexec/meme-5.0.0//meme2meme $meme_up -numbers -bg $home_dir/bg_up-model-1 > meme_up.txt
echo merge downstream_motifs
meme_down=$(find $home_dir/$dir -path '*down/meme.html'| sort)
echo $meme_list
/usr/local/meme5/libexec/meme-5.0.0//meme2meme $meme_down -numbers -bg $home_dir/bg_down-model-1 > meme_down.txt
done
