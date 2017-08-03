#bin/bash
#
# by stef@dev2ops.eu
# June 2017

if [ "$#" -ne 1 ]; then
 echo "Usage: $0 cluster_name"
 exit 1
fi

cluster_name=$1

wd=$DEVOPS_AWS


for i in `aws ec2 describe-instances --filters "Name=tag:cluster_name,Values=$cluster_name" "Name=tag:server_role,Values=master" --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text `
do
	master=$i
done 

# display the status of the kubernetes cluster
echo "One master of cluster $cluster_name is $master"

ssh $master 'kubectl cluster-info '
ssh $master 'kubectl get node '
ssh $master 'kubectl get all --all-namespaces '

