#!/bin/sh
echo begin
date
#choose directory
dir_list=$(ls -d cluster_19_005/)
echo $dir_list
#loop for a folder of each clustering
for dir in $dir_list
do
home_dir=$(pwd)
cd "$home_dir/$dir"
echo current directory:
pwd
mkdir $home_dir/$dir/tomtom_out
echo self_comparison


mkdir $home_dir/$dir/tomtom_out/down_down/
/usr/local/meme5/bin/tomtom meme_down.txt meme_down.txt -oc $home_dir/$dir/tomtom_out/down_down/  -thresh 0.05 #-evalue  # -bfili $home_dir bg_down-model-1
mkdir $home_dir/$dir/tomtom_out/up_up/
/usr/local/meme5/bin/tomtom meme_up.txt meme_up.txt -oc $home_dir/$dir/tomtom_out/up_up/  -thresh 0.05 #-evalue # -bfile $home_dir bg_up-model-1
echo pair_comprison
mkdir $home_dir/$dir/tomtom_out/up_down/
/usr/local/meme5/bin/tomtom meme_up.txt meme_down.txt -oc $home_dir/$dir/tomtom_out/up_down/  -thresh 0.05 #-evalue # -bfile $home_dir bg_up-model-1
mkdir $home_dir/$dir/tomtom_out/down_up/
/usr/local/meme5/bin/tomtom meme_down.txt meme_up.txt -oc $home_dir/$dir/tomtom_out/down_up/ -thresh 0.05 #-evalue # -bfile $home_dir bg_down-model-1 

echo jaspar-search
mkdir $home_dir/$dir/tomtom_out/down_JASPAR/
mkdir $home_dir/$dir/tomtom_out/up_JASPAR/
/usr/local/meme5/bin/tomtom meme_down.txt $home_dir/JASPAR2018_CORE_fungi_non-redundant_pfms_meme.txt -oc $home_dir/$dir/tomtom_out/down_JASPAR/ -thresh 0.05 #-evalue #-bfile $home_dir bg_down-model-1
/usr/local/meme5/bin/tomtom meme_up.txt $home_dir/JASPAR2018_CORE_fungi_non-redundant_pfms_meme.txt -oc $home_dir/$dir/tomtom_out/up_JASPAR/ -thresh 0.05 #-evalue #-bfile $home_dir bg_up-model-1
echo Stability-search
mkdir $home_dir/$dir/tomtom_out/down_stability/
mkdir $home_dir/$dir/tomtom_out/up_stability/
/usr/local/meme5/bin/tomtom meme_down.txt $home_dir/stab_motif -oc $home_dir/$dir/tomtom_out/down_stability -thresh 0.05 #-evalue #-bfile $home_dir bg_down-model-1
/usr/local/meme5/bin/tomtom meme_up.txt $home_dir/stab_motif -oc $home_dir/$dir/tomtom_out/up_stability/ -thresh 0.05 #-evalue #-bfile $home_dir bg_up-model-1
echo Gasch-search
mkdir $home_dir/$dir/tomtom_out/down_Gasch/
mkdir $home_dir/$dir/tomtom_out/up_Gasch/
/usr/local/meme5/bin/tomtom meme_down.txt $home_dir/GASCH_motif -oc $home_dir/$dir/tomtom_out/down_Gasch/ -thresh 0.05 #-evalue #-bfile $home_dir bg_down-model-1
/usr/local/meme5/bin/tomtom meme_up.txt $home_dir/GASCH_motif -oc $home_dir/$dir/tomtom_out/up_Gasch/ -thresh 0.05 #-evalue #-bfile $home_dir bg_up-model-1
echo sublocalize-search
mkdir $home_dir/$dir/tomtom_out/down_sublocalization/
mkdir $home_dir/$dir/tomtom_out/up_sublocalization/
/usr/local/meme5/bin/tomtom meme_down.txt $home_dir/subloc_motif -oc $home_dir/$dir/tomtom_out/down_sublocalization/ -thresh 0.05 #-evalue #-bfile $home_dir bg_down-model-1
/usr/local/meme5/bin/tomtom meme_up.txt $home_dir/subloc_motif -oc $home_dir/$dir/tomtom_out/up_sublocalization/ -thresh 0.05 #-evalue #-bfile $home_dir bg_up-model-1


done
