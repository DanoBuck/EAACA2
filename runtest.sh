#/bin/bash

echo "Starting to gather CPU data"

for i in {1..50}
do
	mpstat | grep "idle" >> out.txt
	#awk '{print $0}'
	
done
