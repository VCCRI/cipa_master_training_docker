
DRUGNAMES=(dofetilide bepridil sotalol quinidine cisapride terfenadine ondansetron chlorpromazine verapamil ranolazine mexiletine diltiazem)

for DRUG in ${DRUGNAMES[@]}; do
  Rscript generate_bootstrap_samples.R -d "$DRUG"
done
