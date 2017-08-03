# by stef@dev2ops.eu
# June 2017
# create as code infra for node(s) of new Kubernetes cluster
# params1 : cluster_name
# params2 : nomber of nodes(s)

#vars
if [ "$#" -ne 2 ]; then
 echo "Usage: $0 cluster_name nb_node(s)"
 exit 1
fi

wd=$DEVOPS_AWS
cluster_name=$1
nbNodes=$2

# create the Node(s) 

for i in `seq 1 $nbNodes`
do

aws ec2 run-instances \
--image-id ami-d9fae5bf \
--security-group-ids sg-c0e404b8 \
--count 1 \
--instance-type t2.medium \
--subnet-id subnet-893e9bd1 \
--key-name devops \
--query 'Instances[0].NetworkInterfaces[0].PrivateIpAddresses[0].PrivateIpAddress' \
--tag-specifications \
	'ResourceType=instance,Tags=[{Key=app_name,Value=kubernetes},{Key=cluster_name,Value='${cluster_name}'},{Key=server_role,Value=node},{Key=Name,Value='${cluster_name}'_node'${i}'},{Key=project_name,Value=devops}]'

done


