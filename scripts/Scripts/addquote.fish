#!/usr/bin/fish

if test ! -n "$QUOTES_FILE"
    set QUOTES_FILE ~/.quotes.yaml
end

set temp /tmp/newquote

echo "" > $temp
echo "  - origin: '"(read -P "Origin: ")"'" >> $temp
echo "    quote:  '"(read -P "Quote: ")"'" >> $temp

if test ! -f $QUOTES_FILE
    mkfile.sh $QUOTES_FILE
end

cat $temp >> $QUOTES_FILE
