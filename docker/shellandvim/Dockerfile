FROM phusion/baseimage:0.9.19

CMD ["/sbin/my_init"]

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /home/root

RUN echo $DEBIAN_FRONTEND > /etc/container_environment/DEBIAN_FRONTEND && \
    echo $HOME > /etc/container_environment/HOME

RUN apt-get -y update && \
    apt-get -y install apt-utils && \
    apt-get -y upgrade && \
    apt-get -y install git tmux

RUN mkdir $HOME
WORKDIR $HOME

RUN chown -R root:root $HOME

COPY .profile .bashrc .bash_aliases $HOME/

COPY prepare.sh /tmp/
RUN /tmp/prepare.sh

COPY vim.sh vimrc /tmp/
RUN /tmp/vim.sh /tmp/vimrc


RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
