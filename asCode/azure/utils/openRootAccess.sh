#!/bin/bash
# by stef@dev2ops.eu
# June 2017
#
# copy the right authorized_keys for root

if [ "$#" -ne 2 ]; then
 echo "Usage: $0 host_name user_name"
 exit 1
fi

host=$1
user=$2

ssh $user@$host 'sudo cp ./.ssh/authorized_keys /root/.ssh/'
