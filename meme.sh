#!/bin/sh
echo begin_down
echo check dir 
pwd
date
#choose directory
#set a mainfolder (the folder which contains folder of clustered sequence files; the results from previous step)
folder_of_interest="cluster_1025_Ward"
dir_list=$(ls -d ./$folder_of_interest/*)
echo $dir_list
#loop for a folder of each clustering (in case there are more than one cluster number used)
for dir in $dir_list
do 
home_dir=$(pwd)
cd "$home_dir/$dir"
echo current directory:
pwd
#loop for each clustered sequence grou resulted from clustering
for file in $home_dir/$dir/*down.fasta; 
do 
echo ${file}
echo start processing $(basename "$file") at:
date
#-dna: specify data in fasta file
#-revcomp: consider reverse complement
#-mod anr: Any Number of Repetitions (a motif might repeats multiple times in one sequence)
#-evt: e-value treashold
#-p 20: paralellise the task to speed things up
#bfile:  background file
#maxw, minw: maximum and minimum width
/usr/local/meme5/bin/meme ${file} -dna -revcomp -mod anr -oc $(basename "$file" .fasta) -nmotifs 30 -evt 0.005 -brief 1000000 -p 20 -bfile $home_dir/bg_down-model-1 -maxw 10 -minw 6
echo finish at:
date
done 
#back to working directory
cd "$home_dir"
echo back to working directory
pwd
done

echo down_meme finished at:
date

echo check dir
pwd
#repeat above loop to upstream sequences
echo begin_up
folder_of_interest="cluster_1025_Ward"
dir_list=$(ls -d ./$folder_of_interest/*)
echo $dir_list
for dir in $dir_list
do
home_dir=$(pwd)
cd "$home_dir/$dir"
echo current directory:
pwd
for file in $home_dir/$dir/*up.fasta;
do
echo ${file}
echo start processing $(basename "$file") at:
date
/usr/local/meme5/bin/meme ${file} -dna -revcomp -mod anr -oc $(basename "$file" .fasta) -nmotifs 30 -evt 0.005 -brief 1000000 -p 20 -bfile $home_dir/bg_up-model-1 -maxw 10 -minw 6
echo finish at:
date
done
cd "$home_dir"
echo back to working directory
done
echo up_meme finished at:
pwd
