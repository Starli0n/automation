#/bin/bash
#
# by stef@dev2ops.eu
# June 2017
# get all instance of a swarm cluster

if [ "$#" -ne 1 ]; then
 echo "Usage: $0 cluster_name"
 exit 1
fi
cluster_name=$1

aws ec2 describe-instances --filters "Name=tag:cluster_name,Values=$1"  --query 'Reservations[*].Instances[*].[InstanceId]' --output text
