#!/bin/bash

names="/home/pravin/scripts/names"

for name in $(cat $names)
do
	echo Characters of movie is $name
done

