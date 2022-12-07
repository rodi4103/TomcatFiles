#!/bin/bash

# write a script excuting the following task


# install java

apt install default-jre

sleep 5


apt install default-jdk

sleep 5

cd /opt
sleep 5
mkdir tomcat
sleep 5
cd tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.84/bin/apache-tomcat-8.5.84.tar.gz
sleep5
ls
tar -xvzf apache-tomcat-8.5.84.tar.gz
sleep 5
rm apache-tomcat-8.5.84.tar.gz
sleep 5
cd apache-tomcat-8.5.84
sleep 5
chmod 777 /opt/tomcat/apache-tomcat-8.5.84/bin/startup.sh
sleep 5
chmod 777 /opt/tomcat/apache-tomcat-8.5.84/bin/shutdown.sh
sleep 5

ln -sf /opt/tomcat/apache-tomcat-8.5.84/bin/startup.sh /usr/local/bin/tomcatup
sleep 5
ln -sf /opt/tomcat/apache-tomcat-8.5.84/bin/shutdown.sh /usr/local/bin/tomcatdown
sleep 5
tomcatup
sleep 5


sed '21 s/Valve/!--Valve/' /opt/tomcat/apache-tomcat-8.5.84/webapps/host-manager/META-INF/context.xml

sed '22 s///--/' /opt/tomcat/apache-tomcat-8.5.84/webapps/host-manager/META-INF/context.xml



sleep 5

 
sed '23 s/Manager/!--Manager/' /opt/tomcat/apache-tomcat-8.5.84/webapps/manager/META-INF/context.xml


sed '24 s///--/' /opt/tomcat/apache-tomcat-8.5.84/webapps/manager/META-INF/context.xml


sleep 5


tomcatdown
sleep 5
tomcatup
sleep 5
cd /opt/tomcat/apache-tomcat-8.5.84
sleep 5 
ls
sleep 5
cd conf
sleep 5
ls
sleep 5



echo "
 <role rolename="manager-gui"/>
 <role rolename="manager-script"/>
 <role rolename="manager-jmx"/>
 <role rolename="manager-status"/>
 <user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx, manager-status"/>
 <user username="deployer" password="deployer" roles="manager-script"/>
 <user username="tomcat" password="s3cret" roles="manager-gui"/>" >> /opt/tomcat/apache-tomcat-8.5.84/conf/tomcat-users.xml


sleep 5 
tomcatdown 
sleep 5

tomcatup
