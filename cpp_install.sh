# make installlation file 

echo "
function blank_file(){
    if [ -d cpp_setup ] 
    then
        rm -R cpp_setup
    fi
    mkdir cpp_setup
    cd cpp_setup
    touch output.txt input.txt testcase.txt gen.py run.sh mycode.cpp truecode.cpp
} "