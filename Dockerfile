FROM rocketchat/hubot-rocketchat:v1.0.11

ENV ROCKETCHAT_URL devops-rocketchat:3000
ENV BOT_NAME hubot
ENV ROCKETCHAT_AUTH password
ENV ROCKETCHAT_USER hubot
ENV ROCKETCHAT_PASSWORD zaq12wsx
ENV ROCKETCHAT_ROOM ''
ENV LISTEN_ON_ALL_PUBLIC true
ENV EXTERNAL_SCRIPTS hubot-pugme,hubot-help
   
VOLUME /home/hubot/scripts
