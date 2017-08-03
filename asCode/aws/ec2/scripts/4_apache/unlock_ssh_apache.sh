#!/bin/bash
# by stef@devp2ops.eu
# july 2017
#
# unlock ssh root access for all Apache instance(s)
#

if [ "$#" -ne 1 ]; then
 echo "Usage: $0 project_name"
 exit 1
fi

project_name=$1

for i in ` ./generateInventoy_apache.py $project_name | egrep -v "\["  `
do
	# unlock by copying authorized_keys
	ssh ec2-user@$i 'sudo cp ~/.ssh/authorized_keys /root/.ssh/authorized_keys ; sudo chmod 600 /root/.ssh/authorized_keys'
	
done
