#!/bin/bash 

# The 6 of these parameters point to 6 different files. 1 file for each room status
# These files contain the status of each room and this script points out which parameter points to which file 

room1d=$(cat /home/wdd/Desktop/security/mosq2/detector/1/log.txt)
room2d=$(cat /home/wdd/Desktop/security/mosq2/detector/2/log.txt)
room3d=$(cat /home/wdd/Desktop/security/mosq2/detector/3/log.txt)
room1s=$(cat /home/wdd/Desktop/security/mosq2/sprinkler/1/log.txt)
room2s=$(cat /home/wdd/Desktop/security/mosq2/sprinkler/2/log.txt)
room3s=$(cat /home/wdd/Desktop/security/mosq2/sprinkler/3/log.txt)


#this is the layout of the dashboard for visualisation for the user
#this dashboard will be printed out constantly in the dashboard.sh script

echo -e "\n\n\n\t\t\t\t\t\tSean's Smoke Alarm\n\n"
echo -e "Room: 1 \t\t Smoke Detector:$room1d \t\t Sprinklers:$room1s \t\t"
echo -e "Room: 2 \t\t Smoke Detector:$room2d \t\t Sprinklers:$room2s \t\t"
echo -e "Room: 3 \t\t Smoke Detector:$room3d \t\t Sprinklers:$room3s \t\t"


