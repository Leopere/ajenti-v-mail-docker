MAINTAINER chamunks@github.com
FROM crosbymichael/python
## SOURCE https://github.com/chamunks/ajenti-v-mail-docker

RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get install -yq wget 
RUN wget http://repo.ajenti.org/debian/key -O- | apt-key add -
RUN echo "deb http://repo.ajenti.org/ng/debian main main ubuntu" >> /etc/apt/sources.list
RUN apt-get update -q
RUN apt-get install -yq ajenti-v-mail 

VOLUME ["/root/ajenti/", "/etc/ajenti/"]

EXPOSE 80 8000 443 143 993 110 995 25 465
ENTRYPOINT ["ajenti-panel"]

###############
## Footnotes ##
###############
## Example NonInteractive Ref: http://goo.gl/0XuJfm
# export DEBIAN_FRONTEND=noninteractive
# apt-get update -q
## Mail Ports
# IMAP uses port 143 , but SSL/TLS encrypted IMAP uses port 993 . POP uses port 110 , but SSL/TLS encrypted # POP uses port 995 . SMTP uses port 25 , but SSL/TLS encrypted SMTP uses port 465 
# http://i.imgur.com/WxFh31g.png