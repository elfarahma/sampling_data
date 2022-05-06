#!/bin/bash

rm -r ./data

# download data cuaca ke dalam folder data

wget -P data https://github.com/labusiam/dataset/raw/main/weather_data.xlsx

cd data

FILE_WEATHER=/home/elfarahma/sampling_data/data/weather_data.xlsx

# konversi data dengan format xlsx menjadi csv

if [ -f "$FILE_WEATHER" ]; then
	echo "file exists"
	in2csv weather_data.xlsx --sheet "weather_2014" > weather_2014.csv

	in2csv weather_data.xlsx --sheet "weather_2015" > weather_2015.csv

else 
	echo "File weather_data.xslx is not found"

fi

# menggabungkan file data tahun 2014 dan 2015 dalam satu file csv

FILE_SLICE_1=/home/elfarahma/sampling_data/data/weather_2014.csv
FILE_SLICE_2=/home/elfarahma/sampling_data/data/weather_2015.csv

if [ -f "$FILE_SLICE_1" && -f "$FILE_SLICE_2" ]; then

	csvstack weather_2014.csv weather_2015.csv >> weather.csv

	# menghapus data cuaca yang masih dalam format xlsx

	rm weather_data.xlsx

else
	echo "file weather_2014.csv and/or weather_2015.csv is not found"

fi

FILE_WCSV=/home/elfarahma/sampling_data/data/weather.csv

# melakukan sampling pada file weather.csv dengan proporsi 0.3

if [ -f "$FILE_WCSV" ]; then

	echo "file exists"
	cat weather.csv | sample -r 0.3 >> sample_weather.csv
else
	echo "file weather.csv is not found"

fi
