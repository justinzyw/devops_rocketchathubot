FROM rocketchat/hubot-rocketchat:v1.0.11

ENV ROCKETCHAT_URL devops-rocketchat:3000
ENV BOT_NAME hubot
ENV ROCKETCHAT_AUTH password
ENV ROCKETCHAT_USER devopsadmin
ENV ROCKETCHAT_PASSWORD zaq12wsx
ENV ROCKETCHAT_ROOM ''
ENV LISTEN_ON_ALL_PUBLIC true

ENV GITLAB_URL http://devops-gitlab
ENV GITLAB_API_KEY aKXqWd3sy4mP6NdsTMAs

ENV EXTERNAL_SCRIPTS hubot-gitsy,
   
VOLUME /home/hubot/scripts
