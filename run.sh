
printf '
for((i=1; ;i++));do
    python3 gen.py > testcase.txt
    ./mycode < testcase.txt > mycode.txt
    ./truecode < testcase.txt > truecode.txt
    if diff mycode.txt truecode.txt > /dev/null
    then
'
printf "\t echo %cTesting testcase %s%s Testcase pass %c" '"' "$" "i" '"' 
printf "\nelse" 
printf "\t echo %cTesting testcase %s%s Testcase fail %c" '"' "$" "i" '"'
printf " diff -w mycode.txt truecode.txt || break ;
        break;
    fi

done"