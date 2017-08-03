#!/bin/sh
j2 -f env ./index.html.j2 vars > ./index.html

j2 -f env ./mod_jk.conf.j2 vars > ./mod_jk.conf

j2 -f env ./workers.properties.j2 vars > ./workers.properties
