#!/usr/bin/python
#
# by stef@dev2ops.eu
# July 2017
#
import sys
from sys import exit
import boto3

# check parameters
if  len(sys.argv) < 2:
	print ('usage : {} cluster_name'.format(sys.argv[0]))
	exit()
cluster_name = sys.argv[1]

master_filters = [{'Name':'tag:app_name', 'Values':['openshift']},{'Name':'tag:cluster_name', 'Values':[cluster_name]},{'Name':'tag:server_role','Values':['master']}]
node_filters = [{'Name':'tag:app_name', 'Values':['openshift']},{'Name':'tag:cluster_name', 'Values':[cluster_name]},{'Name':'tag:server_role','Values':['node']}]
ec2 = boto3.resource('ec2')

#instances = ec2.instances.filter(Filters=[{'Name': 'instance-state-name', 'Values': ['running']}])

print ("[etcd:children]")
print ("masters")
print ("nodes")
print ("[masters]")
instances = ec2.instances.filter(Filters=master_filters)
for instance in instances:
    print(instance.private_dns_name)

print ("[nodes]")
instances = ec2.instances.filter(Filters=node_filters)
for instance in instances:
    print(instance.private_dns_name)

