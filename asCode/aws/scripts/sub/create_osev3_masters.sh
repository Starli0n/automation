# by stef@dev2ops.eu
# June 2017
# create as code infra for master(s) of new Kubernetes cluster
# params1 : cluster_name
# params2 : nomber of master(s)

#vars
if [ "$#" -ne 2 ]; then
 echo "Usage: $0 cluster_name nb_manager(s)"
 exit 1
fi

wd=$DEVOPS_AWS
cluster_name=$1
nbMasters=$2

# create the Master(s) 
for i in `seq 1 $nbMasters`
do

aws ec2 run-instances \
--image-id ami-236c7445 \
--security-group-ids sg-d22ac3aa \
--count 1 \
--instance-type t2.medium \
--subnet-id subnet-893e9bd1 \
--key-name devops \
--query 'Instances[0].NetworkInterfaces[0].PrivateIpAddresses[0].PrivateIpAddress' \
--tag-specifications \
	'ResourceType=instance,Tags=[{Key=app_name,Value=openshift},{Key=cluster_name,Value='${cluster_name}'},{Key=server_role,Value=master},{Key=Name,Value='${cluster_name}'_mst'${i}'},{Key=project_name,Value=devops}]'

done

