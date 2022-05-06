# sampling_data
Tugas 4 SQL/Shell Tooling
# Deskripsi
Repositori ini memuat sebuah script sederhana yang berisi serangkaian command line yang berfungsi melakukan pengunduhan data cuaca, konversi data ke dalam format csv, dan terakhir melakukan sampling data. 

Tahapan yang dijalankan sesuai baris kode dalam script tersebut, dapat dilihat sebagai berikut:



<ol>
  <li>Menghapus folder "data" pada repositori. </li>
  <p></p>
 <blockquote>
    
 <p>rm -r ./data.</p>

 </blockquote>
  
  <li>Melakukan download data cuaca dari link https://github.com/labusiam/dataset/raw/main/weather_data.xlsx dan menyimpannya pada folder "data", dan masuk ke dalam folder "data".</li>
  <p></p>
  
 <blockquote>
    
 <p>wget -P data https://github.com/labusiam/dataset/raw/main/weather_data.xlsx</p>

 <p>cd data</p>

 </blockquote>
  
  <li>Menyimpan lokasi data unduhan (weather_data.xlsx) dalam sebuah variabel.</li>
  <p></p>
  <blockquote>
    
 <p>FILE_WEATHER=/home/elfarahma/sampling_data/data/weather_data.xlsx</p>

 </blockquote>
  <li>Mengkonversi setiap sheet dalam file weather_data.xlsx menjadi format csv, dengan menggunakan if-else statement sebagai defense.</li>
  <p></p>
  <blockquote>
    
  <p>if [ -f "$FILE_WEATHER" ]; then</p>
  <p>   echo "file exists"</p>
  <p>   in2csv weather_data.xlsx --sheet "weather_2014" > weather_2014.csv</p>
  <p>   in2csv weather_data.xlsx --sheet "weather_2015" > weather_2015.csv</p>

  <p>else</p>
  <p>echo "File weather_data.xslx is not found"</p>

  <p>fi</p>

 </blockquote>
  
  <li>Menyimpan lokasi data sheet csv ke dalam variabel, kemudian menggabungkan sheet csv ke dalam satu file weather.csv dan menghapus file weather_data.xlsx (menggunakan if-else statement). </li>
  <p></p>
  <blockquote>
    <p>FILE_SLICE_1=/home/elfarahma/sampling_data/data/weather_2014.csv</p>
FILE_SLICE_2=/home/elfarahma/sampling_data/data/weather_2015.csv

if [ -f "$FILE_SLICE_1" ] && [ -f "$FILE_SLICE_2" ]; then

	csvstack weather_2014.csv weather_2015.csv >> weather.csv
	rm weather_data.xlsx

else
	echo "file weather_2014.csv and/or weather_2015.csv is not found"

fi
  </blockquote>
  <li>Menyimpan lokasi file hasil gabungan (weather.csv) dalam sebuah variabel, dan melakukan sampling data dengan proporsi 0.3, dan menyimpan hasil sampling ke dalam file sample_weather.csv</li>
  <p></p>
  <blockquote>
    <p>FILE_WCSV=/home/elfarahma/sampling_data/data/weather.csv</p>



if [ -f "$FILE_WCSV" ]; then

	echo "file exists"
	cat weather.csv | sample -r 0.3 >> sample_weather.csv
else
	echo "file weather.csv is not found"

fi
  </blockquote>
</ol>

# Instruksi menjalankan script

Pada terminal WSL, jalankan command line berikut
<blockquote>
  <p>./sampling.sh</p>
 </blockquote>
