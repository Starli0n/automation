# by stef@dev2ops.eu
# November 2017
# create as code infra for Base Documentaire
# params1 : project_name

#vars 
if [ "$#" -ne 1 ]; then
 echo "Usage: $0 project_name"
 exit 1
fi

wb=/root/devel/automation/asCode/aws/scripts
project_name=$1

# create Base Documentaire VM(s) 

tmpid=`aws ec2 run-instances \
--image-id ami-d9fae5bf \
--security-group-ids sg-c0e404b8 \
--count 1 \
--instance-type t2.micro \
--subnet-id subnet-893e9bd1 \
--key-name devops \
--query 'Instances[0].InstanceId' ` 

id=`echo $tmpid | awk -F "\""  '{ print $2 }' `

#--query 'Instances[0].NetworkInterfaces[0].PrivateIpAddresses[0].PrivateIpAddress' 
aws ec2 create-tags --resources $id --tags Key=app_name,Value=base_documentaire
aws ec2 create-tags --resources $id --tags Key=project_name,Value=$project_name
aws ec2 create-tags --resources $id --tags Key=server_role,Value=master
aws ec2 create-tags --resources $id --tags Key=Name,Value=$project_name


