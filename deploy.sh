#!/bin/bash
apt update
apt install maven
#delete the existing folder/code to execute the fresh command
rm -rf hello-world-war
#need to clone first
git clone https://github.com/prajwal1327/hello-world-war.git
#switch to hello-world-war
cd hello-world-war
#run the maven package
mvn package
cp -R Tomcatinstallation/tomcat/target/hello-world-war-1.0.0.war Tomcatinstallation/tomcat/webapps/
#stop and start the tomcat
sh Tomcatinstallation/tomcat/bin/shutdown.sh
sleep 2
sh Tomcatinstallation/tomcat/bin/startup.sh
