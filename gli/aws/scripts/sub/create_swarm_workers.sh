# Docker Swarm Cluster Build
# by stef@dev2ops.eu
# June 2017
# create as code infra for worker(s) of new Docker Swarm cluster
# params1 : cluster_name
# params2 : nomber of worker(s)

#vars
if [ "$#" -ne 2 ]; then
 echo "Usage: $0 cluster_name nb_worker(s)"
 exit 1
fi

wd=$DEVOPS_AWS
cluster_name=$1
nbWorkers=$2

# create the Worker(s) 

for i in `seq 1 $nbWorkers`
do

aws ec2 run-instances \
--image-id ami-d9fae5bf \
--security-group-ids sg-af0e15d6 \
--count 1 \
--instance-type t2.micro \
--subnet-id subnet-893e9bd1 \
--key-name devops \
--query 'Instances[0].NetworkInterfaces[0].PrivateIpAddresses[0].PrivateIpAddress' \
--tag-specifications \
	'ResourceType=instance,Tags=[{Key=app_name,Value=swarm},{Key=cluster_name,Value='${cluster_name}'},{Key=server_role,Value=worker},{Key=Name,Value='${cluster_name}'_wk'${i}'},{Key=project_name,Value=devops}]'

done


