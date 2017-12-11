FROM rocketchat/hubot-rocketchat:v1.0.11

ENV ROCKETCHAT_URL devops-rocketchat:3000
ENV BOT_NAME hubot
ENV ROCKETCHAT_AUTH password
ENV ROCKETCHAT_USER devopsadmin
ENV ROCKETCHAT_PASSWORD zaq12wsx
ENV ROCKETCHAT_ROOM ''
ENV LISTEN_ON_ALL_PUBLIC true
ENV RESPOND_TO_DM true

VOLUME /home/hubot/scripts

ENV EXTERNAL_SCRIPTS hubot-pugme,hubot-thank-you,hubot-help,hubot-calculator,hubot-robotstuff,hubot-rocketchat-announcement,hubot-rocketchat-default-response,hubot-gitsy,hubot-jenkins-enhanced,hubot-docker,hubot-grafana,hubot-sonarqube

#for hubot-gitsy
ENV GITLAB_URL http://devops-gitlab:80
ENV GITLAB_API_KEY aKXqWd3sy4mP6NdsTMAs

#for hubot-help
ENV HUBOT_HELP_REPLY_IN_PRIVATE 1

#for hubot-jenkins-enhanced
ENV HUBOT_JENKINS_URL http://devops-jenkins:8080
ENV HUBOT_JENKINS_AUTH devopsadmin:zaq12wsx

#for hubot-grafana
ENV HUBOT_GRAFANA_HOST http://devops-grafana:3000
ENV HUBOT_GRAFANA_API_KEY eyJrIjoiUUpsWnNpM1hCV0cyNFB4N0VxNXFMczZJa202Tk5EUG0iLCJuIjoiaHVib3QiLCJpZCI6MX0=

#for hubot-docker
USER root
COPY ["fix4docker.sh", "/home/hubot"]
RUN chmod 755 /fix4docker.sh
USER hubot
CMD /bin/bash -c fix4docker.sh \ 
  node -e "console.log(JSON.stringify('$EXTERNAL_SCRIPTS'.split(',')))" > external-scripts.json && \
  npm install $(node -e "console.log('$EXTERNAL_SCRIPTS'.split(',').join(' '))") && \
  bin/hubot -n $BOT_NAME -a rocketchat

