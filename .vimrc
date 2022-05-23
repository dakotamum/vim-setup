set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'ycm-core/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'frazrepo/vim-rainbow'
Plugin 'airblade/vim-gitgutter'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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

colo 3dglasses

