#!/bin/bash
PWD=`pwd`

bash /home/fajrinam/soal3a.sh
now=$(date +"%d-%m-%Y")
mkdir "$now"

mv /home/fajrinam/Koleksi_* "./$now"
mv /home/fajrinam/Foto.log "./$now"
