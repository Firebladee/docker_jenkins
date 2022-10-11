FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt-get install -y git gem
USER jenkins
COPY --chown=jenkins:jenkins plugins/* /usr/share/jenkins/ref/plugins/
