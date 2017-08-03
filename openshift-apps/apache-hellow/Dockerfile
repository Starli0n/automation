FROM centos

# Update the image with the latest packages (recommended)
RUN yum update -y; yum clean all

# Install Apache Web Server
RUN yum install -y httpd; yum clean all


# Basic conf
COPY ./cloud.png /var/www/html/cloud.png
COPY ./index.html /var/www/html/index.html

EXPOSE 80
ENTRYPOINT [ "/usr/sbin/httpd" ]
CMD [ "-D", "FOREGROUND" ]
