
TOKEN='5379883980:AAGu-k6ivUkr4dTEnw_0axUrppZJZvPUWAQ'
CHATID='997576216'

squeue > info.txt
finish=$(awk -f script.awk info.txt)
if [ ${finish} -eq 1 ]
then
	curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendMessage -d chat_id=${CHATID} -d text="Calculation finished!"
	crontab -r
fi
rm info.txt
