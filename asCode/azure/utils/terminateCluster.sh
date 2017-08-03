#!/bin/bash
# by stef@dev2ops.eu
# June 2017
#
# terminate all instances of a swarm cluster

if [ "$#" -ne 1 ]; then
 echo "Usage: $0 cluster_name"
 exit 1
fi
cluster_name=$1

wd=$DEVOPS_AWS
ansible=$DEVOPS_ANSIBLE
terminated="terminated"

for i in `$wd/utils/getClusterInstances.sh $cluster_name`
do
	# test if instance is terminated, do nothing if yes
	instance_status=`$wd/utils/getClusterInstanceStatus.sh $i`
	if [ "$instance_status" == "$terminated" ]
	then
		echo "nothing to do , $i is a terminated instance"
	else
		echo -n "terminate instance "$i" ..."
		aws ec2 terminate-instances --instance-ids $i > /dev/null
		echo "done"
	fi
done

# delete inventory hosts file if exists
host_file=$ansible/inventories/hosts_swarm_$cluster_name

if [ -f $host_file ]
then
	rm -rf $host_file
fi
