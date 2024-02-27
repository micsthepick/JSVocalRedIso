cat testing_defines.eel2 > vocalrediso.test.eel2
sed -r -e 's/^(desc|slider[0-9]+):.*|^@(init|slider|block|serialize|sample)//' \
    -e 's/\/\/DEBUGPRINT/printf/' \
    -e 's/\/\/IFTEST|\/\*IFTEST\{\*|\*\}IFTEST\*\///' \
    -e 's/\*IFNTEST\*|IFNTEST\{\*|\*\}IFNTEST//' \
    vocalrediso-jamesdsp.eel >> vocalrediso.test.eel2
./WDL/WDL/eel2/loose_eel ./vocalrediso.test.eel2

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