#!/bin/sh
echo "Press a key to watch tests. Ctrl+C to end"
read c
clear
watch --interval 2 ./runTests.rb 

# should be watch but mac os x completely sucks
while [ 1 ] ; do
  clear
  echo ">> " `date` 
  ./runTests.rb 
  sleep 2
done
