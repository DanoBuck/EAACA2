#/bin/bash

echo "Starting to gather CPU data"

echo "C0 N idle" > results.dat
for i in {1..50}
do
	# Run the loadtest each time and increase the number of users
	timeout 7s ./loadtest $i &
	idle=$(mpstat 6 1 | awk 'END{print $12}')
	C0=$(cat synthetic.dat | wc -l)
	echo $C0 $i $idle
	echo "$C0 $i $idle" >> results.dat
	
done
