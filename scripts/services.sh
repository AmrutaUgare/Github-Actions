#!/bin/bash

function deploy_all_services() {
  allServices=( "auth-service" "account-service" "part-service" "document-service" )

#  allRegions=( "ap-south-1" "north-east-1" )  
#allRegions=() 
	if [[ $1 -eq "sandbox" ]]; then
		echo -e "\nHellooo  $1 "
		allRegions=( "ap-south-1" ) 
	#	exit 1

#	fi 

  for region in "${allRegions[@]}"; do
      echo $region
	echo -e " \n ${GREEN} Using deployment stage **sandbox** from environment variable \n "

      for service in "${allServices[@]}"; do

#        echo $service

        cd "$service/" || exit 0
	pwd 
 
#        echo -e "\n ${GREEN} Using deployment stage **sandbox** from environment variable"
#        make deploy sandbox all
	cd .. 
         echo -e "\n ${PINK} ********* deploying $service ********* \n\n" 
      done
   done
fi 
}

echo make deploy stage

read $stage $serv 
deploy_all_services "$1" "$2"


 
