
#DRUGNAMES=(dofetilide bepridil sotalol quinidine cisapride terfenadine ondansetron chlorpromazine verapamil ranolazine mexiletine diltiazem)
#DRUGNAMES=(quinidine ondansetron diltiazem)
DRUGNAMES=(ondansetron diltiazem)

POP_SIZE="80"
STOPTOL="0.001"
NCORES=32

for DRUG in ${DRUGNAMES[@]}; do
  for IDX in `seq 0 99`; do
    ISTART=$((IDX*20+1))
    ISTOP=$(((IDX+1)*20))
    ISTR="$ISTART"-"$ISTOP"
    Rscript hERG_fitting.R -d "$DRUG" -c $NCORES -i "$ISTR" -l "$POP_SIZE" -t "$STOPTOL" > logfiles/"$DRUG"."$ISTR" 2>&1
    #echo "drug:" $DRUG "pop_size:" $POP_SIZE "stoptol:" $STOPTOL "istr:", $ISTR "istart:" $ISTART "istop:" $ISTOP 
  done
done

#drug: dofetilide pop_size: 80 stoptol: 0.001 istr:, 1-20 istart: 1 istop: 20
#...
#drug: dofetilide pop_size: 80 stoptol: 0.001 istr:, 1981-2000 istart: 1981 istop: 2000
#
#drug: bepridil pop_size: 80 stoptol: 0.001 istr:, 1-20 istart: 1 istop: 20
#...
#drug: bepridil pop_size: 80 stoptol: 0.001 istr:, 1981-2000 istart: 1981 istop: 2000
