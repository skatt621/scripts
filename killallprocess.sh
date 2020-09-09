#!/bin/bash                                                                                                                                                                                                                                                                                                     
# $1 = script/program name                                                       
                                                                                 
if [[ "$1" == "" ]]                                                              
then                                                                             
    echo "Please list a script or program name to KILL."                         
fi                                                                               
                                                                                 
ps -ef | grep "$1" | awk -F " " '{ print $2 }' > file                            
while read p                                                                     
do                                                                               
    kill -9 $p                                                                   
done < file                                                                      
kill file
