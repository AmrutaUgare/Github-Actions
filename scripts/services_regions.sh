#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;92m'
PINK='\033[0;35m'
allServices=( "auth-service" "account-service" "part-service" "document-service" )

function deploy_all_services() {


   if [[ "${1}" -eq "sandbox" ]]
   then
       deploy_region "$1"
  elif [[ "${1}" -eq "prod" ]]
  then
       deploy_all_regions "$1" 
  else
  	echo -e "\n ${RED} Invalid stage \n" 
	 
  fi
 
}

function deploy_all_regions() {
  allRegions=( "ap-south-1" "us-east-2" "ap-northeast-2" "eu-central-1" )

  for region in "${allRegions[@]}"; do
          echo "$region"     # to be remove this line
          echo -e "\n ${GREEN} Using deployment stage ** prod ** from environment variable \n"

          for service in "${allServices[@]}"; do
            cd "$service/"  || exit 0
            pwd     # to be remove this line

#           make deploy stage="${1}"
         cd ..
         echo -e "\n ${PINK} ********* deploying $service  ********* \n"

        done
      done

}

function deploy_region() {
  singleRegion=( "ap-south-1" )

  for region in "${singleRegion[@]}"; do
          echo "$region"     # to be remove this line
          echo -e "\n ${GREEN} Using deployment stage **sandbox** from environment variable \n" 

          for service in "${allServices[@]}"; do
           # echo "$service"   # to be remove this line
            cd "$service/"  || exit 0
            pwd     # to be remove this line

#           make deploy stage="${1}"
         cd ..
         echo -e "${PINK} ********* deploying $service  *********"

        done
      done

}

#echo -e make deploy
#read $stage $ser 
deploy_all_services "$1" "$2"
