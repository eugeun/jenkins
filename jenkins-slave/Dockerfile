FROM openjdk:8-jdk

ENV MAINTAINER "eugeun@mail.ru"
MAINTAINER $MAINTAINER

ENV JENKINS_MASTER jenkins
ENV JENKINS_SLAVE_NAME slave1
ENV JENKINS_SLAVE_SECRET 5dee4faa9e785e67e24521157391ccea435a50d6a327e994c71ca4d685fa0166
ENV JENKINS_SLAVE_HOME="/opt/jenkins/slave"

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000

# ensure existing root of HOME directory
RUN mkdir -p `dirname $JENKINS_SLAVE_HOME` || :

RUN groupadd -g ${gid} ${group} \
&& useradd -d "$JENKINS_SLAVE_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user}

COPY run.sh /run.sh
RUN  chmod a+x /run.sh

USER ${user}

ENTRYPOINT ["/run.sh"]

