#!/usr/bin/dash

#curl cht.sh/$1

echo '- - -   cheat   - - -\n'
cheat $1 | cat

echo '\n- - -   tldr    - - -'
tldr $1 | cat

