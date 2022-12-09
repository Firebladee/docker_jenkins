# Jenkins in Docker

## Overview

## run
docker run -p 8090:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --name jenkins jenkins

## Plugins

to grab plugins
for f in $(docker exec -it jenkins bash -c "ls /var/jenkins_home/plugins/*.jpi"); do docker cp jenkins:`echo $f | sed 's/\r//g'` .; done

