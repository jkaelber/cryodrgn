WORKDIR=$1
i=$2
set -e
set -x
python ${CDRGN_SRC}/utils/analysis/kmeans.py ${WORKDIR}/z.${i}.pkl -k 20 -o ${WORKDIR}/kmeans.labels.${i}.pkl --out-k ${WORKDIR}/kmeans.centers.${i}.txt --out-png ${WORKDIR}/kmeans.${i}.png --on-data
python ${CDRGN_SRC}/eval_decoder.py ${WORKDIR}/weights.${i}.pkl --config ${WORKDIR}/config.pkl --zfile ${WORKDIR}/kmeans.centers.${i}.txt -o ${WORKDIR}/kmeans.${i}
#python ${CDRGN_SRC}/utils/analysis/tsne.py ${WORKDIR}/z.${i}.pkl -o tsne.${i}.pkl 
python ${CDRGN_SRC}/utils/analysis/run_umap.py ${WORKDIR}/z.${i}.pkl -o ${WORKDIR}/umap.${i}.pkl
cp ${CDRGN_SRC}/utils/analysis/cryoDRGN_viz_template.ipynb ${WORKDIR}
