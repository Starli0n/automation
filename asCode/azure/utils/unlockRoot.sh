#!/bin/bash
# by stef@dev2ops.eu
# June 2017

if [ "$#" -ne 1 ]; then
 echo "error: syntax is $0 cluster_name"
 exit 1
fi
cluster_name=$1

host_filename=$DEVOPS_ANSIBLE"/inventories/hosts_swarm_$cluster_name"

if [ ! -f $host_filename ]
then
	echo "the inventory file : $host_filename does not exists, nothing to do !!!"
	exit 0
else

for i in `cat $host_filename | egrep -v "\[" | awk -F "\"" '{ print $2 }'`
do
	echo -n "unlock $i ..."
	$DEVOPS_AZ/utils/openRootAccess.sh $i ubuntu
	echo "done"
done
fi

