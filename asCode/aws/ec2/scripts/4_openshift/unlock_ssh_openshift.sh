#!/bin/bash
# by stef@devp2ops.eu
# july 2017
#
# unlock ssh root access for all instance of the openshift cluster
#

if [ "$#" -ne 1 ]; then
 echo "Usage: $0 cluster_name"
 exit 1
fi

cluster_name=$1

for i in ` ./generateInventoy_openshift.py $cluster_name | egrep -v "\[" | egrep -v "masters" | egrep -v "nodes" `
do
	# unlock by copying authorized_keys
	ssh ec2-user@$i 'sudo cp ~/.ssh/authorized_keys /root/.ssh/authorized_keys ; sudo chmod 600 /root/.ssh/authorized_keys'
	
done
