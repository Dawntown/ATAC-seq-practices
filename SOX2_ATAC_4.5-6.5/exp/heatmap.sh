blacklist="/users/s1155184323/projects/scATAC-benchmarking/xinda_data/SOX2_ATAC_4.5-6.5/genome_ref/mm9-blacklist.bed"

computeMatrix reference-point \
-S h0_2iESC_dTAG.bw \
D0_EpiLC_DMSO.bw \
D1_EpiLC_dTAG.bw \
D1_EpiLC_DMSO.bw \
-R markers_ESCs.bed \
markers_DE.bed \
markers_Meso.bed \
markers_NPC.bed \
--referencePoint center \
-b 2000 \
-a 2000 \
-bs=100 \
-bl $blacklist \
--skipZeros -o matrix2.mat.gz \
--numberOfProcessors 16


plotHeatmap -m matrix2.mat.gz \
-out E45_epiblast_SOX2.2.pdf \
--colorMap coolwarm \
--regionsLabel "ESCs" "DE" "Meso" "NPC" \
--samplesLabel "2iESC (dTAG, h0)" "EpiLC (DMSO, D0)" "EpiLC (dTAG, D1)" "EpiLC (DMSO, D1)"

data_dir="/path/to/data"
score_paths=$(awk -F";" -v path="$data_dir/" '{printf "%s%s ", path, $1}' ttest.txt)
