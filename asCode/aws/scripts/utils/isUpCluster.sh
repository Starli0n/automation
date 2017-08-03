#/bin/bash
#
# by stef@dev2ops.eu
# June 2017
# check if a cluster is Up and Running : all instances

if [ "$#" -ne 2 ]; then
 echo "Usage: $0 app_name cluster_name"
 exit 1
fi

app_name=$1
cluster_name=$2
wd=$DEVOPS_AWS
running="running"
terminated="terminated"

count=0

for i in `$wd/utils/getClusterInstances.sh $cluster_name`
do

	# count the number of instance not in terminated and ruuning state
	status=`$wd/utils/getClusterInstanceStatus.sh $i`
	if [ "$status" != "$terminated" ]
	then
		if [ "$status" != "$running" ]
		then
			count=$((count + 1))
		fi
	fi
done

# if count != 0 that means we have a cluster with instance(s) in transition mode, 
if [ "$count" -eq "0" ]
then
	echo "yes"
else
	echo "no"
fi
