#!/bin/bash
# loop script

COUNT=10
> ~/workspace/count.txt
while (( COUNT > 0 ))
do
  echo -e "This is count: $COUNT" >> ~/workspace/count.txt
  sleep 3
  (( COUNT -- ))
done
