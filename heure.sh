#!/bin/bash

minute=$(date +'%M')
second=$(date +'%S')

while [ 1 ]
do
echo "$minute : $second"
minute=$(date +'%M')
second=$(date +'%S')
sleep 1s
done
