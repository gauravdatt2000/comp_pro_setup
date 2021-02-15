# task
# 1) create a files ( mycode.cpp , truecode.cpp , input.txt , output.txt , testcase.txt , gen.py , run.sh)
# 2)
function blank_file(){
    if [ -d "cpp_setup" ] 
    then
        rm -R cpp_setup
    fi
    mkdir cpp_setup
    cd cpp_setup
    # echo "$PWD"  # working directory
    touch output.txt input.txt testcase.txt gen.py run.sh mycode.cpp truecode.cpp
}

blank_file
