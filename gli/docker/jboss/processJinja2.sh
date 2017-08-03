#!/bin/sh

j2 -f env ./standalone.xml.j2 vars > ./standalone.xml

