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
	print ('usage : {} project_name'.format(sys.argv[0]))
	exit()
project_name = sys.argv[1]

webserver_filters = [{'Name':'tag:app_name', 'Values':['apache']},{'Name':'tag:project_name', 'Values':[project_name]},{'Name':'tag:server_role','Values':['webserver']}]

ec2 = boto3.resource('ec2')


print ("[webservers]")
instances = ec2.instances.filter(Filters=webserver_filters)
for instance in instances:
    print(instance.private_dns_name)


