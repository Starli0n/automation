FROM centos

# Update the image with the latest packages (recommended)
RUN yum update -y; yum clean all

# Install dependencies
RUN yum install -y unzip java-1.7.0-openjdk libselinux-python libsemanage-python ; yum clean all

# copy and extract JBoss files
COPY ./jboss-as-7.1.1.Final.zip /opt
RUN unzip /opt/jboss-as-7.1.1.Final.zip -d /usr/share
RUN mv /usr/share/jboss-as-7.1.1.Final /usr/share/jboss-as
RUN rm /opt/jboss-as-7.1.1.Final.zip

# copy conf files
COPY ./standalone.xml /usr/share/jboss-as/standalone/configuration/standalone.xml

# copy oracle module and conf
RUN mkdir -p /usr/share/jboss-as/modules/oracle/jdbc/main
COPY ./ojdbc6.jar /usr/share/jboss-as/modules/oracle/jdbc/main/ojdbc6.jar
COPY ./module.xml /usr/share/jboss-as/modules/oracle/jdbc/main/module.xml
RUN chmod 644 /usr/share/jboss-as/modules/oracle/jdbc/main/*

# create JBoss user
RUN groupadd -r jboss && useradd --no-log-init -r -g jboss -d /usr/share/jboss-as jboss


# chg owner of jboss home
RUN chown -R jboss:jboss /usr/share/jboss-as

ENV JBOSS_HOME /usr/share/jboss-as
ENV LAUNCH_JBOSS_IN_BACKGROUND true
USER jboss

EXPOSE 8080
EXPOSE 8009
EXPOSE 8090

CMD ["/usr/share/jboss-as/bin/standalone.sh", "-b", "0.0.0.0"]
