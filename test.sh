printf "
printf '
for((i=1; ;i++));do
    python3 gen.py > testcase.txt
    ./mycode < testcase.txt > mycode.txt
    ./truecode < testcase.txt > truecode.txt
    if diff mycode.txt truecode.txt > /dev/null
    then
'
" >run.sh
# printf 'printf ' >>run.sh
# printf '" ' >>run.sh
# printf 'Testing testcase %s Testcase pass'>>run.sh

# printf 'printf "%s Testing testcase %%%c%%%c ' '\t' 's' 's' >>run.sh
# printf 'Testcase pass " "%c" "%c"' '$' 'i' >>run.sh

printf 'printf "%s echo %%%cTesting testcase %%%c%%%c ' '\t' 'c' 's' 's' >>run.sh
printf 'Testcase pass %%%c" %s"%s "%c" "%c" %c"%c' 'c' "'"  "'" '$' 'i' "'" "'" >>run.sh
printf ' '>>run.sh
printf '\nprintf "%selse" ' "\n" >>run.sh
printf '\nprintf "%s echo %%%cTesting testcase %%%c%%%c ' '\t' 'c' 's' 's' >>run.sh
printf 'Testcase fail %%%c" %s"%s "%c" "%c" %c"%c' 'c' "'"  "'" '$' 'i' "'" "'" >>run.sh
# printf ''>>run.sh
printf '\nprintf " diff -w mycode.txt truecode.txt || break ;
        break;
    fi

done"'>>run.sh
