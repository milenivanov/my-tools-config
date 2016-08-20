FROM phusion/baseimage:0.9.19

CMD ["/sbin/my_init"]

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /home/root

RUN echo $DEBIAN_FRONTEND > /etc/container_environment/DEBIAN_FRONTEND
RUN echo $HOME > /etc/container_environment/HOME

RUN apt-get -y update
RUN apt-get -y install apt-utils
RUN apt-get -y upgrade

RUN apt-get -y install git vim wget fontconfig tmux

RUN mkdir $HOME
WORKDIR $HOME

RUN chown -R root:root $HOME

# Vim plugins

# setup pathogen vim plugin manager
RUN mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && \
    wget -P $HOME/.vim/autoload https://tpo.pe/pathogen.vim && \
    echo "execute pathogen#infect()" >> $HOME/.vimrc && \
    echo "syntax on"                 >> $HOME/.vimrc && \
    echo "filetype plugin indent on" >> $HOME/.vimrc && \

# Powerline fonts
    mkdir -p $HOME/.fonts $HOME/.config/fontconfig/conf.d && \
    wget -P $HOME/.fonts                     https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf && \
    wget -P $HOME/.config/fontconfig/conf.d/ https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf && \
    fc-cache -vf $HOME/.fonts/ && \
    echo "set guifont=Droid\\ Sans\\ Mono\\ 10"
# echo "set guifont=Liberation\\ Mono\\ for\\ Powerline\\ 10"

# Sensible
RUN git clone https://github.com/tpope/vim-sensible.git $HOME/.vim/bundle/vim-sensible && \

# Dockerfile syntax & snippet plugin
    git clone https://github.com/ekalinin/Dockerfile.vim.git $HOME/.vim/bundle/Dockerfile && \

# Vim airline
    git clone https://github.com/bling/vim-airline $HOME/.vim/bundle/vim-airline && \
    echo "set laststatus=2"                                    >> $HOME/.vimrc && \
    echo "let g:airline#extensions#tabline#enabled = 1"        >> $HOME/.vimrc && \
    echo "let g:airline#extensions#tabline#left_sep = ' '"     >> $HOME/.vimrc && \
    echo "let g:airline#extensions#tabline#left_alt_sep = '|'" >> $HOME/.vimrc && \

# CtrlP
    git clone https://github.com/kien/ctrlp.vim.git $HOME/.vim/bundle/ctrlp.vim

# Bashrc setup

COPY .profile .bashrc .bash_aliases $HOME/


RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
