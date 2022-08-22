call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'ycm-core/YouCompleteMe'
    Plug 'scrooloose/NERDTree'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'itchyny/lightline.vim'
    Plug 'VundleVim/Vundle.vim'
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'frazrepo/vim-rainbow'
    Plug 'airblade/vim-gitgutter'
    Plug 'kdheepak/lazygit.nvim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
call plug#end()

let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ }

filetype plugin indent on

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
imap jj <Esc>

highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red

let s:mappingState=1
function! ToggleMappings()
    if s:mappingState
        :GitGutterLineHighlightsEnable
    else
        :GitGutterLineHighlightsDisable
    endif
    let s:mappingState = !s:mappingState
endfunction
nnoremap <C-h> :call ToggleMappings()<CR>
nnoremap <silent> <leader>gg :LazyGit<CR>
let g:gitgutter_set_sign_backgrounds = 1

syntax on
set hlsearch
set incsearch
set ignorecase
set spell
set tabstop=4
set shiftwidth=4
set expandtab
set number
set nowrap

set background=dark
colorscheme PaperColor

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

