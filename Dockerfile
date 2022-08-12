FROM amazonlinux:latest

#ENV LANG ja_JP.UTF-8

RUN yum install -y aws-cli jq tar gzip curl jq python3 which openssl

### install kubectl
RUN curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.22.6/2022-03-09/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mkdir -p /root/bin && cp ./kubectl /root/bin/kubectl && export PATH=$PATH:$HOME/bin
RUN echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc

### install badge tool
RUN mkdir /etc/badge-tool 
RUN echo > /etc/badge-tool/config.ini
RUN curl -o install.sh https://tools.badges.rhems-japan.com/install.sh?2022081311
RUN bash ./install.sh
RUN rm -f ./install.sh

