#!/bin/bash

YES=0
NO=0
COUNTER=0
DIFF_RES=""

my_cat=(
"./s21_cat"
)
my_result=(
"my_result.txt"
)
catt=(
    "cat"
)
cat_result=(
    "cat_result.txt"
)
for var1 in b e n s t v
do
for path in testing_cat.txt no_test.txt
do
$my_cat -$var1 $path > my_result.txt
$catt -$var1 $path > cat_result.txt
DIFF_RES="$(diff -s my_result.txt cat_result.txt)"
(( COUNTER++ ))
if [ "$DIFF_RES" == "Files my_result.txt and cat_result.txt are identical" ]
    then
      (( YES++ ))
        echo "\033[31m$FAIL\033[0m/\033[32m$SUCCESS\033[0m/$COUNTER \033[32msuccess\033[0m/Path is:$path options are:$var"
    else
      (( NO++ ))
        echo "\033[31m$FAIL\033[0m/\033[32m$SUCCESS\033[0m/$COUNTER \033[31mfail\033[0m/Path is:$path options are:$var"
    fi
done
done


rm my_result.txt cat_result.txt
echo "FAILS: $NO"
echo "SUCCESSFUL: $YES"
echo "ALL: $COUNTER"

if [[ $NO -ne 0 ]] 
then
    exit 1
else
    exit 0
fi
