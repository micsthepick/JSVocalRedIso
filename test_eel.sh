cat testing_defines.eel2 > vocalrediso.test.eel2
sed -r -e 's/^(desc|slider[0-9]+):.*|^@(init|slider|block|serialize|sample)//' \
    -e 's/\/\/DEBUGPRINT/printf/' \
    -e 's/\/\/IFTEST|\/\*IFTEST\{\*|\*\}IFTEST\*\///' \
    -e 's/\*IFNTEST\*|IFNTEST\{\*|\*\}IFNTEST//' \
    vocalrediso-jamesdsp.eel >> vocalrediso.test.eel2

# Run the command, capturing stderr
{ output=$(./WDL/WDL/eel2/loose_eel ./vocalrediso.test.eel2 2>&1 1>&3-); } 3>&1

# Check if there is any output in stderr
if [ ! -z "$output" ]; then
    # Print the stderr output in red
    echo -e "\e[31m$output\e[0m"
    # Exit with -1
    exit -1
else
    exit 0
fi

##//DEBUGPRINT("HI");
##//IFTEST code_here();
##/*IFTEST{*
##  more_code();
##*}IFTEST*/
##/*IFNTEST*/called_when_not_testing();
##/*IFNTEST{*/
## also_called_when_not_testing();
##/*}IFNTEST*/

# will transform to

##printf("HI");
## code_here();
##
##  more_code();
## 
##//called_when_not_testing();
##/*IFNTEST{*/
## also_called_when_not_testing();
##/*IFNTEST}*/