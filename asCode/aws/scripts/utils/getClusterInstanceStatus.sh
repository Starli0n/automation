#/bin/bash
#
# by stef@dev2ops.eu
# June 2017
# get all instance of a swarm cluster

if [ "$#" -ne 1 ]; then
 echo "Usage: $0 InstanceId"
 exit 1
fi
id=$1

#aws ec2 describe-instance-status --instance-ids $instance_id --query 'InstanceStatuses[0].InstanceState.Name' | awk -F "\"" '{ print $2 }'
aws ec2 describe-instances --instance-ids $id  --query 'Reservations[*].Instances[*].[State.Name]' --output text

