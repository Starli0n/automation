#bin/bash
#
# by stef@dev2ops.eu
# June 2017
# show all instance(s) of a swarm cluster

if [ "$#" -ne 1 ]; then
 echo "Usage: $0 cluster_name"
 exit 1
fi
cluster_name=$1
app_name=swarm

aws ec2 describe-instances --filters "Name=tag:cluster_name,Values=$1"  --query 'Reservations[*].Instances[*].{InstanceId:InstanceId,Status:State.Name,Ip:PrivateIpAddress,Role:Tags[0].Value}' --output table
