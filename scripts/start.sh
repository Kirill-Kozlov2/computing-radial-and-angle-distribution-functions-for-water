#!/usr/bin/bash
#SBATCH --no-requeue
#SBATCH --job-name="lammps"
#SBATCH --get-user-env
#SBATCH --partition=RT
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --exclusive
#SBATCH --comment="infa 2022"

TOKEN='5379883980:AAGu-k6ivUkr4dTEnw_0axUrppZJZvPUWAQ'
CHATID='997576216'

cd ~/computing-radial-and-angle-distribution-functions-for-water
##crontab scripts/crontab.sh

mkdir -p log/
mkdir -p data/
mkdir -p dump/
mkdir -p png/

curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendMessage -d chat_id=${CHATID} -d text="Starting process..."

for temp in 300
do
	sed "s/YYYYTemp/$temp/g" in/in.spce > in/in.spce_for_run
	srun --exclusive -N 1 -p RT --ntasks-per-node=8 ~/bin/lmp_mpi -in in/in.spce_for_run > log/log_$temp.txt

	sed "s/YYYYTemp/$temp/g" scripts/script.gnuplot > scripts/script_temp.gnuplot
	gnuplot scripts/script_temp.gnuplot

	curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendPhoto -F chat_id=${CHATID} -F photo="@png/rdf_${temp}.png" -F caption="Temp: $temp finished"
	echo "Temp: $temp finished"
	curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendPhoto -F chat_id=${CHATID} -F photo="@png/adf_${temp}.png" -F caption="Temp: $temp finished" 
done

