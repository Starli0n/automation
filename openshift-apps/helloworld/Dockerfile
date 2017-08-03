FROM devops/jboss

# copy an app in the deployment directory
COPY ./jboss-helloworld.war /usr/share/jboss-as/standalone/deployments/

ENV JBOSS_HOME /usr/share/jboss-as
ENV LAUNCH_JBOSS_IN_BACKGROUND true
USER jboss

EXPOSE 8080
EXPOSE 8009
EXPOSE 8090

CMD ["/usr/share/jboss-as/bin/standalone.sh", "-b", "0.0.0.0"]
