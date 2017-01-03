# Introduction
This project aimed to deploy dockerized Jenkins with some slaves

# Setup Actions
## Prepare Persistent Jenkins Home
If you like to save Jenkins settings between docker recreation we need to setup some volume container. In this case we would not have any issues related to simply mapping to the underlying Windows file system
```
# Start from root of the project
cd jenkins-home/
sudo docker build -t eugeun/jenkins_home .
sudo docker create --name jenkins_home eugeun/jenkins_home /bin/true
# As long as origin Jenkins image run process under unpriveledge user we have to grant that unpriveledge user to write in his home
sudo docker run -it --rm --volumes-from jenkins_home ubuntu:16.04
# Run in the container the commands:
root@f8a422804be1:/# mkdir /var/lib/jenkins/home
root@f8a422804be1:/# chown 1000 /var/lib/jenkins/home
root@f8a422804be1:/# chgrp 1000 /var/lib/jenkins/home
root@f8a422804be1:/# exit

```
## Prepare Slave image
Create jenkins-slave image. Don't worry about JENKINS_SLAVE_SECRET, later you will have a chance to actualized them
```
# Start from root of the project
cd jenkins-slave/
sudo docker build -t eugeun/jenkins_slave .
```
## Run Dockerized Jenkins
1. run docker-compose, find master's auth key in the docker-compose output and type it into the web admin available on `http://<your-host>:8080`
2. create some JNLP slaves in the web admin, find slave's secrets in the web admin
3. uncomment slaves in the docker-compose.yaml and actualize their secrets
3. rerun docker-compose
