#!/usr/bin/fish

set FILE ~/.quotes.yaml
set TEMP /tmp/quotes.json

yq -o=json . $FILE > $TEMP

set LENGTH (cat $TEMP | jshon -e quotes -l)

if test (count $argv) -eq 1
    ; and isnumber.fish $argv[1]
    ; and test $argv[1] -lt $LENGTH
    ; and test $argv[1] -ge 0
    set INDEX $argv[1]
else
    set INDEX  (math (date +%N) % $LENGTH)
end

set QUOTE  (cat $TEMP | jshon -e quotes -e $INDEX)

echo " "
echo $QUOTE | jshon -e quote -u | fold -w 80 -s - | awk '{ print "\t" $0 }'
printf "\n\t\t- "
echo $QUOTE | jshon -e origin -u
echo " "
