#!/bin/bash

#cd $1/test
#mkdir `seq 1 $2`

##########################
# 1. Create ProgressBar function
# 1.1 Input is currentState($1) and totalState($2)
function ProgressBar {
# Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

# 1.2 Build progressbar strings and print the ProgressBar line
# 1.2.1 Output example:
# 1.2.1.1 Progress : [########################################] 100%
printf "\rProgress : [${_fill// /\#}${_empty// /-}] ${_progress}%%"

}

# Go to target path
cd $1/test

# Variables
_start=1

# This accounts as the "totalState" variable for the ProgressBar function
_end=$2

# Proof of concept
for number in $(seq ${_start} ${_end})
do
    #sleep 0.1
    mkdir $number
    ProgressBar ${number} ${_end}
done
printf '\nFinished!\n'
