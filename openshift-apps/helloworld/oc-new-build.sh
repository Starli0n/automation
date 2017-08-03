#!/bin/sh
#
# create the build for this Docker Image
#
# please login as devops with : oc login -u devops
#
oc new-build https://github.com/scampagna/openshift-apps.git --context-dir='helloworld' --strategy=docker --to='devops/helloworld:latest' --name='devops-helloworld'
