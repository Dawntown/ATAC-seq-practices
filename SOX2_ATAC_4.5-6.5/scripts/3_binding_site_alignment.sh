source ./config.sh

ref_dir=$1
# mode=$2

score_paths=$(awk -F";" -v path="$data_dir/" '{printf "%s%s ", path, $1}' $ref_dir/atacfiles.txt)
samplesLabel=$(awk -F";" '{printf "%s ", $2}' $ref_dir/atacfiles.txt)
marker_beds=$(awk -F":" -v path="$ref_dir/" '{printf "%smarkers_%s.bed ", path, $1}' $marker_gene_list)
regionsLabel=$(awk -F":" '{printf "%s ", $1}' $marker_gene_list)


computeMatrix reference-point \
-S $score_paths \
-R $marker_beds \
--referencePoint center \
-b 2000 \
-a 2000 \
-bs=100 \
--skipZeros \
-bl $blacklist \
--outFileName $ref_dir/data.matrix.gz \
--numberOfProcessors 16




# computeMatrix reference-point \
# -S h0_2iESC_dTAG.bw \
# D0_EpiLC_DMSO.bw \
# D1_EpiLC_dTAG.bw \
# D1_EpiLC_DMSO.bw \
# -R markers_ESCs.bed \
# markers_DE.bed \
# markers_Meso.bed \
# markers_NPC.bed \
# --referencePoint TSS \
# -b 2000 \
# -a 2000 \
# -bs=100 \
# -bl $blacklist \
# --skipZeros -o matrix2.mat.gz \
# --numberOfProcessors 16

plotHeatmap -m $ref_dir/data.matrix.gz \
-out $ref_dir/${ref_dir##*/}.pdf \
--colorMap coolwarm \
--regionsLabel $regionsLabel \
--samplesLabel $samplesLabel
