#!/bin/sh

# process templates fles
./processJinja2.sh

# build the image
docker build -t devops/apache .
