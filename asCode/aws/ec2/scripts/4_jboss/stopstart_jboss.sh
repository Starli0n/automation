#!/bin/bash
# by stef@dev2ops.eu
# June 2017
# stop or start the EC2 instance(s) for JBoss
# 

if [ "$#" -ne 2 ]; then
 echo "Usage: $0 project_name {start|stop}"
 exit 1
fi
project_name=$1
action=$2

case $action in
        start)
                ec2_state="running"
                ;;
        stop)
                ec2_state="stopped"
                ;;
        *)
                echo "Usage: $0 project_name {start|stop}"
                exit 1
esac



wd=~/devel/gli/aws/ec2/ansible


echo -n "Changing state of $project_name JBoss server(s) to $ec2_state ... "


# changing state
ansible-playbook -e project_name=$project_name -e expected_state=$ec2_state $wd/playbooks/jboss_stopstart_servers.yaml


echo " done"
