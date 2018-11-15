#!/bin/sh
echo begin
date
#choose directory
folder_of_interest="cluster_1025_Ward"
echo check working dir:
dir_list=$(ls -d ./$folder_of_interest/*)
echo $dir_list
#loop for a folder of each clustering
for dir in $dir_list
do
home_dir=$(pwd)
cd "$home_dir/$dir"
echo current directory:
pwd

#loop for each cluster resulted from clustering
for query in $(find $home_dir/$dir -name '*meme.html' |sort);
do
echo $query
target01=$(find $home_dir/$dir -name '*up.fasta'| sort)
for target in $target01
do
echo target file $target
#mast_out is created to store each mast result for each cluster in their respective subfolder.
#because there is no control over output filename (it always uses mast.html/.xml/.txt), we have to create subfolder system for mast loop in order to protect the result files from getting overwritten.
#rm -r $(dirname $query)/mast_out/
mkdir $(dirname $query)/mast_out/
/usr/local/meme5/bin/mast ${query} ${target} -oc $(dirname $query)/mast_out/$(basename $target .fasta) -bfile $home_dir/bg_up-model-1
done
target02=$(find $home_dir/$dir -name '*down.fasta'| sort)
for target in $target02
do
echo target file $target
#rm -r $(dirname $query)/mast_out/
mkdir $(dirname $query)/mast_out/
/usr/local/meme5/bin/mast ${query} ${target} -oc $(dirname $query)/mast_out/$(basename $target .fasta) -bfile $home_dir/bg_down-model-1
done
done
cd "$home_dir"
done
