#/bin/bash

echo "Starting to gather CPU data"

echo "CO N idle" > results.dat
for i in {1..50}
do
	# Run the loadtest each time and increase the number of users
	./loadtest $i  &
	idle=$(mpstat | awk 'END{print $NF}')
	C0=$(cat synthetic.dat | wc -l)
	mpstat >> mpstat.txt
	echo $C0 $i $idle
	echo "$C0   $i $idle" >> results.dat
	
done
