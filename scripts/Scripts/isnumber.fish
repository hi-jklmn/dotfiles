#!/usr/bin/fish

if test (count $argv) -gt 2
    set filename (status filename | string match -r '[^/]*$')
    echo "$filename error - Usage: $filename argument_to_test" >&2
    exit 1
end

# Test whether math likes it as a numeric expression
math "$argv[1] + 1" > /dev/null 2> /dev/null
# Then return whether math failed
exit $status
