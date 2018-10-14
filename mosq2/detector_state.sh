#!/bin/bash

echo "Room?"
read room
echo "What is the detector status?"
echo "Please pick OFF or ON"
read status


#these 6 are commented out - tried to make sure this was the status of the rooms when the script was first ran by the user 
#echo "OK" > /home/wdd/Desktop/security/mosq2/detector/1/log.txt
#echo "OK" > /home/wdd/Desktop/security/mosq2/detector/2/log.txt
#echo "OK" > /home/wdd/Desktop/security/mosq2/detector/3/log.txt


#echo "OFF" > /home/wdd/Desktop/security/mosq2/sprinkler/1/log.txt
#echo "OFF" > /home/wdd/Desktop/security/mosq2/sprinkler/2/log.txt
#echo "OFF" > /home/wdd/Desktop/security/mosq2/sprinkler/3/log.txt


mosquitto_pub -t house/$room/detector -m "$status"  #this will publish the room given in the parameter and the status to devices listening to detector




if [ $room -eq 1 ]  #parameter entered for room is 1 
then
	echo $status > /home/wdd/Desktop/security/mosq2/detector/$room/log.txt  	#overwrite the log of $status in the detector/$room/log.txt file
	echo $status > /home/wdd/Desktop/security/mosq2/sprinkler/$room/log.txt 
elif [ $room -eq 2 ]  #parameter entered for room is 2 
then
	echo $status > /home/wdd/Desktop/security/mosq2/detector/$room/log.txt  	#overwrite the log of $status in the detector/$room/log.txt file
	echo $status > /home/wdd/Desktop/security/mosq2/sprinkler/$room/log.txt 
elif [ $room -eq 3 ]  #parameter entered for room is 3
then
	echo $status > /home/wdd/Desktop/security/mosq2/detector/$room/log.txt  	#overwrite the log of $status in the detector/$room/log.txt file
	echo $status > /home/wdd/Desktop/security/mosq2/sprinkler/$room/log.txt
else
	echo "Wrong input"
fi 

if [ $status == "ON" ] 
then
	echo "Alarm" > /home/wdd/Desktop/security/mosq2/detector/$room/log.txt
else 
	echo "Status Ok" > /home/wdd/Desktop/security/mosq2/detector/$room/log.txt  #if the status isn't on then then it's assumed the detector status is ok 
fi



