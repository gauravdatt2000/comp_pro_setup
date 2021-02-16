
function blank_file(){
    if [ -d cpp_setup ] 
    then
        rm -R cpp_setup
    fi
    mkdir cpp_setup
    cd cpp_setup
    touch output.txt input.txt testcase.txt gen.py run.sh mycode.cpp mycode.txt truecode.cpp truecode.txt

 echo "

#include <bits/stdc++.h>
using namespace std ;
void code(){
    // your code 
}
int main(void)
{
    int test;
    cin>>test;
    
    while(test--){
        code();
    }
}

 ">>mycode.cpp 
 echo "

import sys
import random

#testcase

test=1
print(test)

for i in range(test):
    print(random.randint(1,100))


 ">>gen.py 

printf '
for((i=1; ;i++));do
    python3 gen.py > testcase.txt
    ./mycode < testcase.txt > mycode.txt
    ./truecode < testcase.txt > truecode.txt
    if diff mycode.txt truecode.txt > /dev/null
    then
'>>run.sh
printf "\t echo %cTesting testcase %s%s Testcase pass %c" '"' "$" "i" '"' >>run.sh 
printf "\nelse" >>run.sh
printf "\t echo %cTesting testcase %s%s Testcase fail %c" '"' "$" "i" '"' >>run.sh
printf " diff -w mycode.txt truecode.txt || break ;
        break;
    fi

done">>run.sh
}
blank_file
