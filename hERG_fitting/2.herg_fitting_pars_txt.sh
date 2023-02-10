
#DRUGNAMES=(dofetilide bepridil sotalol quinidine cisapride terfenadine ondansetron chlorpromazine verapamil ranolazine mexiletine diltiazem)
DRUGNAMES=(ondansetron diltiazem)

POP_SIZE="80"
STOPTOL="0.001"
NCORES=32

for DRUG in ${DRUGNAMES[@]}; do
  Rscript hERG_fitting.R -d "$DRUG" -c $NCORES -l "$POP_SIZE" -t "$STOPTOL" > logfiles/"$DRUG".0 2>&1
done

