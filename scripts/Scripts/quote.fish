#!/usr/bin/fish

set FILE ~/.quotes.yaml
set TEMP /tmp/quotes.json

yq -o=json . $FILE > $TEMP

set LENGTH (cat $TEMP | jshon -e quotes -l)
set QUOTE  (cat $TEMP | jshon -e quotes -e (math (date +%N) % $LENGTH))

echo " "
echo $QUOTE | jshon -e quote -u | fold -w 80 -s - | awk '{ print "\t" $0 }'
printf "\n\t\t- "
echo $QUOTE | jshon -e origin -u
echo " "
