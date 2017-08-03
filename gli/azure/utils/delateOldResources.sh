#!/bin/sh
#
# delete old resources on Azrure
#

#vars
if [ "$#" -ne 1 ]; then
 echo "Usage: $0 cluster_name "
 exit 1
fi

cluster_name=$1

for i in `az resource list  --tag cluster_name=$cluster_name --query "[].id" -o tsv`
do
	az resource delete --id $i 
done
