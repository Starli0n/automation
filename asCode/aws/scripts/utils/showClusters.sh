#bin/bash
#
# by stef@dev2ops.eu
# June 2017

if [ "$#" -ne 1 ]; then
 echo "Usage: $0 app_name"
 exit 1
fi

app_name=$1

wd=$DEVOPS_AWS

for i in `aws ec2 describe-instances --filters "Name=tag:app_name,Values=$app_name"  --query 'Reservations[*].Instances[*].Tags[*]' --output text | grep cluster_name | sort -u | awk  '{ print $2 }'`
do
	echo -n "$i : "
	exist=`$wd/utils/existCluster.sh $app_name $i`
	if [ "$exist" == "yes" ]
	then
		echo "online"
	else
		echo "terminated"
	fi
done 

