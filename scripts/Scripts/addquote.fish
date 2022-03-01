#!/usr/bin/fish

set QUOTES_FILE ~/Miscellaneous/quotes.yaml

if test ! -n "$QUOTES_FILE"
    set QUOTES_FILE ~/Miscellaneous/quotes.yaml
end

set temp /tmp/newquote

echo "" > $temp
echo "  - origin: '"(read -P "Origin: ")"'" >> $temp
echo "    quote:  '"(read -P "Quote: ")"'" >> $temp

if test ! -f $QUOTES_FILE
    mkfile.sh $QUOTES_FILE
end

cat $temp >> $QUOTES_FILE
