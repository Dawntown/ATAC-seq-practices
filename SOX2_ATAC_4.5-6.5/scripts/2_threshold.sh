
source ./config.sh

ref_bw=$1
mode=$2

# 2. Threshold the bed file
for thre in 5 10 20 50 100; do
    awk -v thre=$thre '$5 > thre' $work_dir/${ref_bw%.*}/${mode}.bed > $work_dir/${ref_bw%.*}/${mode}_thre${thre}.bed
done
