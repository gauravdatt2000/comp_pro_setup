
printf '
for((i=1; ;i++));do
    python3 gen.py > testcase.txt
    ./mycode < testcase.txt > mycode.txt
    ./truecode < testcase.txt > truecode.txt
    if diff mycode.txt truecode.txt > /dev/null
    then
'
printf "\t echo %cTesting testcase %s%s Testcase pass %c" '"' "$" "i" '"'