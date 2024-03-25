
source ./config.sh

ref_bw=$1

while IFS= read -r line; do
    markers=$(echo $line | sed "s/.*: //")
    echo $markers
    grep_command="grep -i \"$markers\" $work_dir/${ref_bw%.*}/annoted_full.bed > $work_dir/${ref_bw%.*}/markers_${line%%:*}.bed"
    # echo $grep_command
    eval $grep_command
done < $marker_gene_list

# grep -i 'pou5f1\|Nanog\|SOX2' $ref_reg > markers_ESCs.bed
# grep -i 'GATA6\|EOMES\|SOX17' $ref_reg > markers_DE.bed
# grep -i 'ISL1\|HAND1\|TBX3' $ref_reg > markers_Meso.bed
# grep -i 'GBX2\|SOX1\|PAX6' $ref_reg > markers_NPC.bed


# for bed in `ls markers*.bed`
# do
# awk 'BEGIN {OFS="\t"} {print $1, $2, $3}' $bed > gene_${bed%.*}.bed
# done