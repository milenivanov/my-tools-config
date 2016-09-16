set -o errexit

VIMRCFILE=${1}

apt-get -y install vim fontconfig

# setup pathogen vim plugin manager
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle
wget -P $HOME/.vim/autoload https://tpo.pe/pathogen.vim
echo "execute pathogen#infect()" >> $HOME/.vimrc

# Sensible
git clone https://github.com/tpope/vim-sensible.git $HOME/.vim/bundle/vim-sensible

# Dockerfile syntax & snippet plugin
git clone https://github.com/ekalinin/Dockerfile.vim.git $HOME/.vim/bundle/Dockerfile

# Vim airline
git clone https://github.com/bling/vim-airline $HOME/.vim/bundle/vim-airline
echo "set laststatus=2"                                    >> $HOME/.vimrc
echo "let g:airline#extensions#tabline#enabled = 1"        >> $HOME/.vimrc
echo "let g:airline#extensions#tabline#left_sep = ' '"     >> $HOME/.vimrc
echo "let g:airline#extensions#tabline#left_alt_sep = '|'" >> $HOME/.vimrc

# CtrlP
git clone https://github.com/kien/ctrlp.vim.git $HOME/.vim/bundle/ctrlp.vim

# NERDTree
git clone https://github.com/scrooloose/nerdtree.git $HOME/.vim/bundle/nerdtree

# Complete vimrc configuration
cat $VIMRCFILE >> $HOME/.vimrc

