FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt-get install -y git ruby shellcheck npm
RUN gem install mdl
RUN npm install -g npm-groovy-lint
USER jenkins
COPY --chown=jenkins:jenkins plugins/* /usr/share/jenkins/ref/plugins/
