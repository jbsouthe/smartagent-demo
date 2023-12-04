FROM ubuntu
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker
RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y unzip vim apt-utils perl python3 openjdk-11-jdk wget curl inetutils-telnet \
  && apt-get install -y tomcat9 tomcat9-admin 

COPY appdsmartagent_cli_64_linux_23.11.0.1239.zip /tmp
COPY appdsmartagent_64_linux_23.11.0.1239.zip /tmp
COPY start.sh /tmp
COPY loadgen.sh /tmp
COPY target/demoServlet-1.0-SNAPSHOT.war /usr/share/tomcat9/webapps/api.war


EXPOSE 8080
# For debug swap out the entrypoint and terminal in
#ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["sh", "/tmp/start.sh"]
