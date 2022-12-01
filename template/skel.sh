#!/bin/bash
set -e

for i in `seq 5`; do
	for j in `seq 5`; do
		printf '%s\t' $((i * j))
	done
	echo
done
