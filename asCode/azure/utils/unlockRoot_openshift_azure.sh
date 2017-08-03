#!/bin/bash
# by stef@dev2ops.eu
# June 2017

if [ "$#" -ne 1 ]; then
 echo "Usage: $0 cluster_name"
 exit 1
fi
cluster_name=$1

ssh_filename="/root/tmp/openshift-ansible/inventory/byo/hosts_osev3_ssh_$cluster_name"

if [ ! -f $host_filename ]
then
	echo "the inventory file : $host_filename does not exists, nothing to do !!!"
	exit 0
else

for i in `cat $ssh_filename`
do
	echo -n "unlock $i ..."
	ssh ubuntu@$i 'sudo mkdir -p /root/.ssh'
	ssh ubuntu@$i 'sudo cp ./.ssh/authorized_keys /root/.ssh/'
	echo " done"
done
fi
