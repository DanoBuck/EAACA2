#/bin/bash

echo "Starting to gather CPU data"

for i in {1..50}
do
	mpstat >> output.txt
done
