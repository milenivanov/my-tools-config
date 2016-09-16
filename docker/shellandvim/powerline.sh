set -o errexit

apt-get -y install python3.5 python3-pip
pip3 install --user powerline-status

echo "PATH=$PATH:~/.local/bin"       >> $HOME/.bashrc
echo "powerline-daemon -q"           >> $HOME/.bashrc
echo "POWERLINE_BASH_CONTINUATION=1" >> $HOME/.bashrc
echo "POWERLINE_BASH_SELECT=1"       >> $HOME/.bashrc
echo                                 >> $HOME/.bashrc
echo "POWERLINE_CONFIG_COMMAND=/home/root/.local/bin/powerline-config"                      >> $HOME/.bashrc
echo ". /home/root/.local/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh" >> $HOME/.bashrc
