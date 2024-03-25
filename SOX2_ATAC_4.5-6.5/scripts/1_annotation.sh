# 2. annote the bed file with overlapped genes

source ./config.sh

ref_bw=$1

# intersect, window, closest
# merge
# bedtools closest -D ref \
# -a $work_dir/${ref_bw%.*}/${ref_bw%.*}.bed \
# -b $ref_file \
# -wa \
# > $work_dir/${ref_bw%.*}/annoted_closest.bed


bedtools intersect \
-a $work_dir/${ref_bw%.*}/${ref_bw%.*}.bed \
-b $annot_file \
-wa -wb \
> $work_dir/${ref_bw%.*}/annoted_full.bed



