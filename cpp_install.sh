# make installlation file 
# NOTE == > make sure to <  cd ~bin > while actuall submitting code to github , while testing keep in off , or on 
# NOTE ===> when installing make sure to follow the following commands 
# commands 
# sudo su // get administrator login  
# bash cpp_install.sh
# cd ~bin
echo "
function blank_file(){
    if [ -d cpp_setup ] 
    then
        rm -R cpp_setup
    fi
    mkdir cpp_setup
    cd cpp_setup
    touch output.txt input.txt testcase.txt gen.py run.sh mycode.cpp mycode.txt truecode.cpp truecode.txt
" > cpp.sh

#template 1

echo ' echo "'>> cpp.sh
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
" >>cpp.sh
echo ' ">>mycode.cpp '>>cpp.sh

#template 2

echo ' echo "'>>cpp.sh

echo '
import sys
import random

#testcase

test=1
print(test)

for i in range(test):
    print(random.randint(1,100))

'>>cpp.sh

echo ' ">>gen.py '>>cpp.sh


# template 3 rewrite chk some bug

echo ' echo " '>>cpp.sh

echo ' 
for((i=1; ;i++));do
    python3 gen.py > testcase.txt
    ./mycode < testcase.txt > mycode.txt
    ./truecode < testcase.txt > truecode.txt
    if diff mycode.txt truecode.txt > /dev/null
    then
        echo "Testing testcase $i Testcase pass"
    else
        echo "Testing testcase $i Testcase fail"
        diff -w mycode.txt truecode.txt || break ;
        break;
    fi

done
'>>cpp.sh

echo ' ">>run.sh '>>cpp.sh



echo "
}
blank_file" >> cpp.sh
