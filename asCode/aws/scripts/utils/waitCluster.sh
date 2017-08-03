#/bin/bash
#
# by stef@dev2ops.eu
# June 2017
# warit a cluster until he becomes up and running

if [ "$#" -ne 2 ]; then
 echo "Usage: $0 app_name cluster_name"
 exit 1
fi

app_name=$1
cluster_name=$2
wd=$DEVOPS_AWS

yes="yes"
isup="no"

echo -n "waiting the $app_name cluster $cluster_name  to be up ..."

while [ "$isup" != "$yes" ] ; do
	# get the statis of the cluster
	status=`$wd/utils/isUpCluster.sh $app_name $cluster_name`
	if [ "$status" == "$yes" ]
	then
		isup=$yes
	else
		sleep 3
		echo -n "."
	fi
done
echo " done"

