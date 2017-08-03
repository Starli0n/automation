#!/bin/bash
# by stef@dev2ops.eu
# June 2017
# stop or start the EC2 instance(s) for an Openshift cluster
# 

if [ "$#" -ne 2 ]; then
 echo "Usage: $0 cluster_name {start|stop}"
 exit 1
fi
cluster_name=$1
action=$2

case $action in
        start)
                ec2_state="running"
                ;;
        stop)
                ec2_state="stopped"
                ;;
        *)
                echo "Usage: $0 cluster_name {start|stop}"
                exit 1
esac



wd=~/devel/gli/aws/ec2/ansible


echo -n "Changing state of $cluster_name Openshift cluster to $ec2_state ... "


# changing state
ansible-playbook -e cluster_name=$cluster_name -e expected_state=$ec2_state $wd/playbooks/openshift_stopstart_cluster.yaml


echo " done"
