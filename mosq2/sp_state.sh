#!/bin/bash 

mosquitto_sub -v -h localhost -t house/+/cur/sprinkler | while read data 

do

room=$(echo $data | cut -d/ -f2) #this reads the publish. The -d/ splits the text up by forward slash and the -f2 reads the second field on the split


message=$(echo $data | cut -d" " -f2) #cutting the second entry with a splitter of a space 

	if [ $message == "ON" ] 
	then 
		mosquitto_pub -t house/$room/new/sprinkler -m "TURN ON"
		echo "STATUS:Sprinkler is on in Room:$room"
		 
	elif [ $message == "OFF" ] 
	then	
		mosquitto_pub -t house/$room/new/sprinkler -m "TURN OFF"
		echo "Sprinkler is off in Room:$room"
	 
	else
		echo "Invalid Command."
	fi
done
