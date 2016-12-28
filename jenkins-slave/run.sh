#!/bin/bash

# wait for master
sleep 20

git config --global user.email "${MAINTAINER}"
git config --global user.name "Jenkins Slave '${JENKINS_SLAVE_NAME}'"

curl -L -o "${JENKINS_SLAVE_HOME}/slave.jar" "http://${JENKINS_MASTER}:8080/jnlpJars/slave.jar"

java -jar ${JENKINS_SLAVE_HOME}/slave.jar -jnlpUrl http://${JENKINS_MASTER}:8080/computer/${JENKINS_SLAVE_NAME}/slave-agent.jnlp -secret ${JENKINS_SLAVE_SECRET}

