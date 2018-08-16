#/bin/sh
echo begin_down
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
#loop for each cluster resulted from clustering
for file in $home_dir/$dir/*down.fasta; 
do 
echo ${file}
echo start processing $(basename "$file") at:
date
#-dna: specify data in fasta file
#-revcomp: consider reverse complement
#-mod anr
#-p 20: paralellise the task to speed things up
/usr/local/meme5/bin/meme ${file} -dna -revcomp -mod anr -oc $(basename "$file" .fasta) -nmotifs 30 -evt 0.005 -brief 1000000 -p 20 -bfile $home_dir/bg_down-model-1 -maxw 10 -minw 6
echo finish at:
date
done 
cd ".."
done

echo begin_up
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
#loop for each cluster resulted from clustering
for file in $home_dir/$dir/*up.fasta;
do
echo ${file}
echo start processing $(basename "$file") at:
date
#-dna: specify data in fasta file
#-revcomp: consider reverse complement
#-mod anr
#-p 20: paralellise the task to speed things up
/usr/local/meme5/bin/meme ${file} -dna -revcomp -mod anr -oc $(basename "$file" .fasta) -nmotifs 30 -evt 0.005 -brief 1000000 -p 20 -bfile $home_dir/bg_up-model-1 -maxw 10 -minw 6
echo finish at:
date
done
cd ".."
done

