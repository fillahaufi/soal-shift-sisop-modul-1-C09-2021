#!bin/bash

printf "\nsoal 1a. list INFO/ERROR, message, dan username: \n"
cut -d ":" -f 4 syslog.log
printf "\n"
printf "soal 1b. list ERROR dan jumlah tiap ERROR : \n"
cut -d ":" -f 4 syslog.log | grep ERROR | cut -d "(" -f1 | cut -d " " -f3-10 | sort | uniq -c 
printf "\n"
printf "soal 1c. List jumlah INFO dan ERROR tiap user : \n"
printf "Jumlah ERROR tiap user : \n"
cut -d ":" -f 4 syslog.log | grep ERROR | cut -d "(" -f2 | cut -d ")" -f1 |  sort | uniq -c
printf "\nJumlah INFO tiap user : \n"
cut -d ":" -f 4 syslog.log | grep INFO | cut -d "(" -f2 | cut -d ")" -f1 | sort |  uniq -c
printf "\n"
printf "soal 1d. Error, Count csv :  \n"
printf "Error,Count"
printf "\n"
ERROR1() {
	cut -d ":" -f 4 syslog.log | grep "Connection to DB failed" | wc -l
}
printf "Connection to DB failed," 
ERROR1

ERROR2() {
        cut -d ":" -f 4 syslog.log | grep "Permission denied while closing ticket" | wc -l
}
printf "Permission denied while closing ticket," 
ERROR2

ERROR3() {
        cut -d ":" -f 4 syslog.log | grep "The ticket was modified while updating" | wc -l
}
printf "The ticket was modified while updating," 
ERROR3

ERROR4() {
        cut -d ":" -f 4 syslog.log | grep "Ticket doesn't exist" | wc -l
}
printf "Ticket doesn't exist," 
ERROR4

ERROR5() {
        cut -d ":" -f 4 syslog.log | grep "Timeout while retrieving information" | wc -l
}
printf "Timeout while retrieving information," 
ERROR5

ERROR6() {
        cut -d ":" -f 4 syslog.log | grep "Tried to add information to closed ticket" | wc -l
}
printf "Tried to add information to closed ticket," 
ERROR6
printf "\n"
printf "soal 1e. Username,INFO,ERROR csv : \n"
username=`cat syslog.log | cut -d "(" -f2 | cut -d ")" -f1 | sort | uniq`
echo "$username" |
while read jml 
do
	infosum=`cat syslog.log | grep -o "INFO.*($jml)" | wc -l`
	errorsum=`cat syslog.log | grep -o "ERROR.*($jml)" | wc -l`
	echo "$jml,$infosum,$errorsum"
done | sed '1 i\Username,INFO,ERROR' > info_error.csv
echo "create info_error.csv"
