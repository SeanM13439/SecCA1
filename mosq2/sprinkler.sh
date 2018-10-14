#!/bin/bash 

mosquitto_sub -v -h localhost -t house/+/act/sprinkler | while read data 

do 

room=$(echo $data | cut -d/ -f2) #this reads the publish. The -d/ splits the text up by forward slash and the -f2 reads the second field on the split

message=$(echo $data | cut -d" " -f2)

	if [ $message == "ACTIVATE" ] 
	then 
		mosquitto_pub -t house/$room/cur/sprinkler -m "ON"
		echo "Turning on sprinkler in $room" 
	elif [ $message == "DEACTIVATE" ] 
	then	
		mosquitto_pub -t house/$room/cur/sprinkler -m "OFF"
		echo "Turning off sprinkler in $room" 
	else
		echo "Invalid Command."
	fi
done
