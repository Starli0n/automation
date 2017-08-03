#!/bin/sh
#
# get all private addresses of openshift cluster on Azure
# and create the inventory file
#

#vars
if [ "$#" -ne 1 ]; then
 echo "Usage: $0 cluster_name "
 exit 1
fi

wd=$DEVOPS_AZ

cluster_name=$1

echo "[masters]"
$wd/utils/getClusterPrivateAddresses.sh $cluster_name master
echo "[etcd:children]"
echo "masters"
echo "[nodes]"
$wd/utils/getClusterPrivateAddresses.sh $cluster_name node

