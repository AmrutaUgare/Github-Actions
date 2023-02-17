#!/bin/bash

declare -a allServices=( "auth-service" "account-service" "part-service" "document-service" )
declare -a allRegion=( "ap-south-1" "north-east-1")

declare -a deploy=("allServices" "allRegion")

for group in "${deploy[@]}"; do
	lst="$group[@]"
	echo "name: ${group} with members: ${!lst}"
	for element in "${!lst}"; do
		echo -en "\tworking on $element of the $group group\n"
	done
done 
