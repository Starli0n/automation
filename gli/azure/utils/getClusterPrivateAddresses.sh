#!/bin/sh
#
# get all private addresses of openshift cluster on Azure
#

#vars
if [ "$#" -ne 2 ]; then
 echo "Usage: $0 cluster_name [master|node] "
 exit 1
fi

cluster_name=$1
role=$2

for i in `az resource list --resource-type Microsoft.Network/networkInterfaces  --query "[?tags.cluster_name=='$cluster_name']|[?tags.server_role=='$role'].id" -o tsv `
do
	az resource show --id $i --query "properties.ipConfigurations[].properties.privateIPAddress" -o tsv
done
