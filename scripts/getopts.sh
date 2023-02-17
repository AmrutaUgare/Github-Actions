#!/bin/bash

stage=""
service=""
region=""
handler=""

function validate_service() {

	echo -e "\n $service "
}

function validate_region() {
	echo -e "\n $region region"
}

function validate_stage() {
	echo -e "\n $stage environment "
}

function validate_handler() {
	echo -e "\n $handler is exists "
}


while getopts t:s:r:h: options; do
	case $options in
		t) stage=$OPTARG;;
		s) service=$OPTARG;;
		r) region=$OPTARG;;
		h) handler=$OPTARG;;

		*) echo invalid options;;  
	esac
done



echo -e "t=$stage, s=$service, r=$region, h=$handler "

validate_service $service
validate_region $region
validate_stage $stage 
validate_handler $handler 
