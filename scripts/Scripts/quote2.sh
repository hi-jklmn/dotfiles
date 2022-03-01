#!/usr/bin/dash

# set -xe

FILE=~/Miscellaneous/quotes.yaml
TEMP=/tmp/quotes.json

yq -o=json . $FILE > $TEMP

LENGTH=$(cat $TEMP | jshon -e quotes -l)
QUOTE=$(cat $TEMP | jshon -e quotes -e $(printf "(%d %% %d)\n" `date +%N` $LENGTH | bc))

echo " "
echo $QUOTE | jshon -e quote -u | fold -w 80 -s - | awk '{ print "\t" $0 }'
printf "\n\t\t- "
echo $QUOTE | jshon -e origin -u
echo " "
