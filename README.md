# soal-shift-sisop-modul-1-C09-2021
# Laporan Resmi Modul 1 #

## Soal 1 ##
### Pengerjaan ###
#### Soal 1a. ####
1. Diminta untuk mereturn error dan info yang ada, message, dan username
2. Menggunakan cut untuk mengambil bagian dari suatu line
3. Fungsi yang dijalankan = 
  ```
  cut -d “:” -f 4 syslog.log
  ```
4. Fungsi tersebut akan membuat beberapa field yang dibatasi oleh limiter “:” ditunjukkan oleh -d “:” dan mengambil field ke-4 yang ditunjukkan oleh -f 4
5. Contoh output = 

![image](https://user-images.githubusercontent.com/63279983/113287716-22f65800-9318-11eb-8457-5b492e6f3fa2.png)


#### Soal 1b. ####
1. Diminta untuk mereturn list error dan jumlah tiap errornya
2. Menggunakan cut, grep, sort, dan uniq
3. Fungsi yang dijalankan = 
  ```
  cut -d “:” -f 4 syslog.log | grep ERROR | cut -d “(“ -f1 | cut -d “ “ -f3-10 | sort | uniq -c
  ```
4. Setelah menjalankan fungsi yang sama seperti soal 1a, fungsi selanjutnya adalah grep ERROR yang berarti mereturn semua ERROR pada log file, setelah itu melakukan cut lagi untuk menghilangkan username, menjalankan fungsi sort untuk sorting dan uniq -c untuk menghitung banyaknya error yang sama tiap error message
5. Output = 

![image](https://user-images.githubusercontent.com/63279983/113287755-330e3780-9318-11eb-85ae-7eb6e45ec612.png)


#### Soal 1c. ####
1. Diminta untuk mereturn jumlah list dan error tiap user
2. Menggunakan cut, grep, sort, dan uniq
3. Fungsi yang dijalankan = 
  1.Untuk ERROR = cut -d “:” -f 4 syslog.log | grep ERROR | cut -d “(“ -f2 | cut -d “)” -f1 | sort | uniq -c
  2.Untuk INFO = cut -d “:” -f 4 syslog.log | grep INFO | cut -d “(“ -f2 | cut -d “)” -f1 | sort | uniq -c
4. Logika yang dijalankan hampir sama seperti sub soal sebelumnya, pertama untuk mendapatkan jumlah ERROR tiap user kita grep dahulu semua error yang ada, lalu cut untuk mengambil username, lalu uniq -c untuk menghitung jumlahnya, begitu juga untuk mendapatkan jumlah INFO
5. Output =

![image](https://user-images.githubusercontent.com/63279983/113287792-40c3bd00-9318-11eb-925b-b4ffd3c6a386.png)
![image](https://user-images.githubusercontent.com/63279983/113287814-48836180-9318-11eb-8d03-d05162ef7516.png)


#### Soal 1d. ####
1. Diminta menampilkan Error, Count dalam bentuk csv
2. Menggunakan fungsi untuk menampilkan count tiap error
3. Salah satu fungsi yang dijalankan = 
```
ERROR1() {
	cut -d “:” -f 4 syslog.log | grep “Connection to DB failed” | wc -l
}
Printf “Connection to DB failed,”
ERROR1
```
4. Pada nomor ini saya masih belum bisa menggunakan algoritma dalam menampilkan dan masih menggunakan grep secara manual untuk tiap error message
5. Output = 

![image](https://user-images.githubusercontent.com/63279983/113287856-546f2380-9318-11eb-911a-64825fa71358.png)


#### Soal 1e. ####
1. Diminta menampilkan Usernaame,INFO,ERROR dalam bentuk csv
2. Fungsi yang digunakan hampir sama seperti soal - soal sebelumnya
3. fungsi yang dijalankan =
```
username=`cat syslog.log | cut -d "(" -f2 | cut -d ")" -f1 | sort | uniq`
echo "$username" |
while read jml
do
	infosum=`cat syslog.log | grep -o "INFO.*($jml)" | wc -l`
	errorsum=`cat syslog.log | grep -o "ERROR.*($jml)" | wc -l`
	echo "$jml,$infosum,$errorsum"
done | sed '1 i\Username,INFO,ERROR' > info_error.csv
echo "create info_error.csv"
```
4. variable $username untuk mendapat username, setelah itu dilakukan looping tiap username menggunakan while untuk mendapatkan jumlah info dan error tiap username nya. meethod sed berfungsi untuk menambahkan row line secara manual pada csv file dan echo dimaksudnya untuk memberikan flash message pada pengguna
5. output = 

![image](https://user-images.githubusercontent.com/63279983/113467024-809ab980-946a-11eb-8731-a28f920763de.png)
![image](https://user-images.githubusercontent.com/63279983/113467035-927c5c80-946a-11eb-8117-3487ef733e19.png)
![image](https://user-images.githubusercontent.com/63279983/113467046-a2943c00-946a-11eb-83e7-92f8304d8dd9.png)


### Kendala ###
- Masih belum cukup mengerti cara kerja linux terminal
- Awam dengan linux
- Tidak tahu keyword di google untuk mencari referensi


## Soal 2 ##
### Pengerjaan ###
#### Soal 2a. ####
1. Diminta untuk mencari Row ID dan Profit Percentage terbesar(Jika ada profit percentage terbesar lebih dari 1, cari yang Row ID 
terbesar).
2. Profit Percentage =
  ```
  (Profit / Cost Price) * 100
  ```
3. Cost Price =
  ```
  Sales - Profit
  ```
4. Dicek dulu apakah Row ID bukan 1(karena row tersebut untuk penentuan identitas kategori)
5. Diambil nilai profit dan sales di tiap row(column 21 dan 18)
6. Kemudian dikurangi untuk mendapatkan cost price. Kemudian dicari Profit percentage menggunakan rumus di step 2
7. Kemudian dibandingkan nilai profit percentage sekarang dengan maksimal. Jika melebihi maksimal, maka profit percentage sekarang menjadi maksimal dan diambil row ID nya.
8. Kemudian hasilnya di print dan disimpan ke hasil.txt

#### Soal 2b. ####
1. Dicari nama customer pada transaksi tahun 2017 di Albuquerque
2. Untuk memfilter tanggal bisa menggunakan /[0-9][0-9]-[0-9][0-9]-17/
3. Kemudian diambil lokasi nya (column 10) dan dicek apakah sama dengan Albuquerque, jika ya, maka dimasukkan array untuk menyimpan nama customer (column 7)
4. Setelah itu, print hasil array nama customer dan simpan ke hasil.txt

#### Soal 2c. ####
1. Diminta mencari segment customer dan jumlah transaksinya paling sedikit.
2. Dicek dulu apakah Row ID bukan 1(karena row tersebut untuk penentuan identitas kategori). Kemudian diambil array nama segment customer (column 8).
3. Dibandingkan jumlah transaksi customer dengan minimal. Jika lebih kecil dari minima, maka segment customer menjadi minimal dan diambil tag namanya.
4. Setelah itu, print nama segment customer terkecil dan jumlah transaksinya. SImpan hasilnya ke hasil.txt

#### Soal 2d. ####
1. Diminta mencari region dengan total keuntungan (profit paling sedikit) dan total keuntungan wilayah tersebut.
2. Dicek dulu apakah Row ID bukan 1(karena row tersebut untuk penentuan identitas kategori). Kemudian diambil array nama region (column 13) dan ditambahkan dengan profit (column)
3. Dibandingkan jumlah total keuntungan (profit) dengan minimal. Jika lebih kecil dari minima, maka region tersebut menjadi minimal dan diambil tag namanya.
4. Setelah itu, print nama regio total keuntungan terkecil dan total keuntungan. SImpan hasilnya ke hasil.txt

### Kendala ###
- Masih kurang tahu dalam penggunaan linux dan shell
- Error berkali-kali
- Kurang tahu dalam mengoperasikan terminal linux 


## Soal 3 ##
### Pengerjaan ###
#### Soal 3a. ####
1. Diminta membuat script untuk mengunduh 23 gambar dari "https://loremflickr.com/320/240/kitten" serta menyimpan log-nya ke file Foto.log
2. Menggunakan fungsi ``` wget -a $PWD/Foto.log -O $PWD/"Koleksi_0$i" https://loremflickr.com/320/240/kitten ``` untuk mengunduh gambar serta menyimpan log-nya ke file Foto.log
3. Menggunakan fungsi ``` loc_img=($(awk '/Location/ {print $2}' $PWD/Foto.log)) ``` untuk mendapat alamat dari gambar yang diunduh
4. Menggunakan looping untuk mengecek dan menghapus kemungkinan ada gambar yang sama
5. Kemudian menyimpan gambar - gambar tersebut dengan nama "Koleksi_XX"
```
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
```
#### Soal 3b. ####

#### Soal 3c. ####

#### Soal 3d. ####

#### Soal 3e. ####

### Kendala ###
