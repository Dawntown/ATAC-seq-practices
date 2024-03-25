# rsync -aP rsync://hgdownload.soe.ucsc.edu/genome/admin/exe/linux.x86_64/bigWig* ~/app/bin/

# 1. Convert bigwig to bed

source ./config.sh

ref_bw=$1

mkdir -p $work_dir/${ref_bw%.*}

bigWigToWig $data_dir/$ref_bw $work_dir/${ref_bw%.*}/${ref_bw%.*}.wig
wig2bed < $work_dir/${ref_bw%.*}/${ref_bw%.*}.wig > $work_dir/${ref_bw%.*}/${ref_bw%.*}.bed
rm -rf $work_dir/${ref_bw%.*}/${ref_bw%.*}.wig
