FROM centos

# Update the image with the latest packages (recommended)
RUN yum update -y; yum clean all

# Install Apache Web Server
RUN yum install -y httpd; yum clean all


# Basic conf
COPY ./cloud.png /var/www/html/cloud.png
COPY ./index.html /var/www/html/index.html

# module(s)
COPY ./mod_jk.so /etc/httpd/modules/mod_jk.so
RUN chmod 755 /etc/httpd/modules/mod_jk.so
COPY ./mod_jk.conf /etc/httpd/conf.d/mod_jk.conf
RUN chmod 644 /etc/httpd/conf.d/mod_jk.conf
COPY ./workers.properties /etc/httpd/conf/workers.properties


EXPOSE 80
ENTRYPOINT [ "/usr/sbin/httpd" ]
CMD [ "-D", "FOREGROUND" ]
