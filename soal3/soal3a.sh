#!/bin/bash
PWD=`pwd`

rm -f $PWD/Foto.log
rm -f $PWD/location.log

img=23
i=1
a=9
  for i in $(seq $img);
  do
	if [ $i -le $a ]
	then
	wget -a $PWD/Foto.log -O $PWD/"Koleksi_0$i" https://loremflickr.com/320/240/kitten
 	else 
	wget -a $PWD/Foto.log -O $PWD/"Koleksi_$i" https://loremflickr.com/320/240/kitten
	fi
  done

loc_img=($(awk '/Location/ {print $2}' $PWD/Foto.log))
for ((i=0; i<23; i++))
do
for ((j=0; j<=i; j++))
do 
if [[ "$j" != "$i" && "${loc_img[$j]}" == "${loc_img[$i]}" ]]; then
	count=$((j+1))	
	if [ $count -le 9 ];
	then 
	rm -f $PWD/Koleksi_0$count
	else	
	rm -f $PWD/Koleksi_$count
	fi
fi
done
done
