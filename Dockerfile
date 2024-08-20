FROM amazonlinux:latest

#ENV LANG ja_JP.UTF-8

RUN yum install -y aws-cli jq tar gzip jq python3 python3-pip which openssl

### install kubectl
RUN curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.17/2024-04-19/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mkdir -p /root/bin && cp ./kubectl /root/bin/kubectl && export PATH=$PATH:$HOME/bin
RUN echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc

### install badge tool
RUN mkdir /etc/badge-tool 
RUN echo > /etc/badge-tool/config.ini
RUN curl https://tools.badges.rhems-japan.com/install.sh?$( cat /dev/urandom | base64 | fold -w 10 | head -n 1) -o install.sh
RUN bash ./install.sh
RUN rm -f ./install.sh

