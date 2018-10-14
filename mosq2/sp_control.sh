#!/bin/bash 

mosquitto_sub -v -h localhost -t house/+/detector | while read data #listening to publishes coming from detector

do

room=$(echo $data | cut -d/ -f2) #this reads the publish. The -d/ splits the text up by forward slash and the -f2 reads the second field on the split
status=$(echo $data | cut -d" " -f2) #same as the last line. This time it splits it up using a space and the field will only show "OFF" or "ON"

	if [ $status == "ON" ] #if the status is ON that comes from the detector publish then do this
	then 
		mosquitto_pub -t house/$room/act/sprinkler -m "ACTIVATE" #publsihing to sprinkler to ACTIVATE 
		echo "Activating the sprinkler in $room"
	elif [ $status == "OFF" ] 
	then 
		mosquitto_pub -t house/$room/act/sprinkler -m "DEACTIVATE" #publishing to sprinkler to DEACTIVATE
		echo "Deactivating the sprinkler in $room" 
	else 
		echo "Invalid input. Please enter a correct input." 
	fi 
done

