#!/bin/bash
cd saiku-core
mvn clean install 
# -DskipTests=true 
cd ..
cd saiku-webapp
mvn clean install
cd ..
git submodule init
git submodule update
cd saiku-ui
git fetch
mvn clean package install:install-file -Dfile=target/saiku-ui-2.2-SNAPSHOT.war  -DgroupId=org.saiku -DartifactId=saiku-ui -Dversion=2.2-SNAPSHOT -Dpackaging=war
cd ../saiku-server
mvn clean package
cd ../saiku-bi-platform-plugin
mvn clean package
