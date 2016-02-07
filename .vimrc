set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent
set relativenumber
set number
set encoding=utf-8
set fileencoding=utf-8
set ignorecase
set hlsearch
set colorcolumn=80
set list listchars=tab:>-,trail:·,extends:>  "show trailing whitespace

nmap ; :

set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set directory=~/tmp

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Search for visually selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy/<C-R><C-R>=substitute(
    \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
    \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy?<C-R><C-R>=substitute(
    \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
    \gV:call setreg('"', old_reg, old_regtype)<CR>

autocmd BufWritePre *.cpp,*.h :%s/\s\+$//e  "trim trailing whitespace

colorscheme desert

" Powerline
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2  " Always show statusline
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

execute pathogen#infect()
