data_matrix_fn=$1

plotHeatmap \
-m $data_matrix_fn \
--colorMap coolwarm \
-out ${data_matrix_fn%.*}.pdf


