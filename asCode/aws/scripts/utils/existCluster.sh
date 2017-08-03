#/bin/bash
#
# by stef@dev2ops.eu
# June 2017
# check if a cluster exists

if [ "$#" -ne 2 ]; then
 echo "Usage: $0 app_name cluster_name"
 exit 1
fi

app_name=$1
cluster_name=$2
wd=$DEVOPS_AWS
terminated="terminated"

echo "no"
exit 0

count=0

for i in ` aws ec2 describe-instances --filters "Name=tag:cluster_name,Values=$cluster_name"  --query 'Reservations[*].Instances[*].[InstanceId]' --output text`
do
	# count the number of instance in the swarm cluster, without instance in terminated state
	status=`$wd/utils/getClusterInstanceStatus.sh $i`
	if [ "$status" != "$terminated" ]
	then
		count=$((count + 1))
	fi
done

# if count != 0 that means we have a cluster with that name
if [ "$count" -eq "0" ]
then
	echo "no"
else
	echo "yes"
fi
