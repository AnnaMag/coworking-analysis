#!/bin/sh
# processing cvs data from Meetup analysis 
# Usage:
# ./process_meetup_csv.sh file.csv
# 
# It’s a quick command line alternative to e.g. OpenRefine. Useful when data privacy is an is sue (no data uploads and clouds)
# 
# create a list of cities
echo "london berlin,barcelona prague milan budapest lisboa amsterdam oslo copenhagen helsinki stockholm warsaw paris" > cities_meetup.txt

# extract categories, clean text, count occurrences 
for city in `cat cities_meetup.txt`; do
    echo $city
    cat coworking_meetup.csv | grep “$city”  | cut -d[ -f2 | cut -d] -f1 | sed "s/\'//g" | tr ',' '\n' |  sort | uniq -c  > meetup_categ_\$city.txt 

done

# inspect,  or make word_cloud


