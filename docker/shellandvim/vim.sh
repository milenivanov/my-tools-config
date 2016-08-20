set -o errexit

VIMRCFILE=${1}

# setup pathogen vim plugin manager
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle
wget -P $HOME/.vim/autoload https://tpo.pe/pathogen.vim
echo "execute pathogen#infect()" >> $HOME/.vimrc

# Powerline fonts
mkdir -p $HOME/.fonts $HOME/.config/fontconfig/conf.d
wget -P $HOME/.fonts https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
wget -P $HOME/.config/fontconfig/conf.d/ https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf && \
    fc-cache -vf $HOME/.fonts/ && \
    echo "set guifont=Droid\\ Sans\\ Mono\\ 10"

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

# Complete vimrc configuration
cat $VIMRCFILE >> $HOME/.vimrc

