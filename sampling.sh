#!/bin/bash

rm -r ./data

# download data cuaca ke dalam folder data

wget -P data https://github.com/labusiam/dataset/raw/main/weather_data.xlsx

cd data

# konversi data dengan format xlsx menjadi csv

in2csv weather_data.xlsx --sheet "weather_2014" > weather_2014.csv

in2csv weather_data.xlsx --sheet "weather_2015" > weather_2015.csv


# menggabungkan file data tahun 2014 dan 2015 dalam satu file csv


csvstack weather_2014.csv weather_2015.csv >> weather.csv

# menghapus data cuaca yang masih dalam format xlsx

rm weather_data.xlsx

# melakukan sampling pada file weather.csv dengan proporsi 0.3

echo date,actual_mean_temp,actual_min_temp,actual_max_temp,average_min_temp,average_max_temp,record_min_temp,record_max_temp,record_min_temp_year,record_max_temp_year,actual_precipitation,average_precipitation,record_precipitation > sample_weather.csv

cat weather.csv | sample -r 0.3 >> sample_weather.csv
