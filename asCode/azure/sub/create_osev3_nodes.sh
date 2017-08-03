# by stef@dev2ops.eu
# June 2017
# create as code infra for nodes(s) of new Openshift cluster
# params1 : cluster_name
# params2 : nomber of nodes(s)

#vars
if [ "$#" -ne 2 ]; then
 echo "Usage: $0 cluster_name nb_nodes(s)"
 exit 1
fi

wd=$DEVOPS_AWS
cluster_name=$1
nbNodes=$2

# create the Master(s) 
for i in `seq 1 $nbNodes`
do

az vm create \
-g devops \
--nsg sg_devops \
-n ${cluster_name}node$i \
--image CentOS \
--size Standard_DS1_v2 \
--tags project_name=devops app_name=openshift server_role=node cluster_name=$cluster_name Name=${cluster_name}_node_$i

done

