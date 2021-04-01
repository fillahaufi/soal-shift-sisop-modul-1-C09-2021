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


Soal 1e.
