#!/bin/sh
#
# create the build for this Docker Image
#
# please login as devops with : oc login -u devops
#
oc new-build https://github.com/scampagna/openshift-apps.git --context-dir='apache' --strategy=docker --to='devops/apache:latest' --name='devops-apache'
