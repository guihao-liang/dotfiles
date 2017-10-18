set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Guihao's plugins
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" comment code with cmd gcc or gc
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'
" fuzzy searching for files
Plugin 'wincent/command-t'
Plugin 'terryma/vim-multiple-cursors'
" auto add delimiter
Plugin 'Raimondi/delimitMate'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" dash integration
Plugin 'rizzatti/dash.vim'
" tmux
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'

" erlang
Plugin 'jimenezrick/vimerl'
" C++
Plugin 'octol/vim-cpp-enhanced-highlight'
" Plugin 'tpope/vim-pathogen'

" All of your Plugins must be added before the following line
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

" choose airline theme
" let g:airline_theme='simple' 

" vim settings of Guihao Liang
syntax enable

" practical vim
" filepath of active buffer but removing the filename.
" map %% to %:h.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' :'%%'

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" echo $HOME."/.vim/colors/moriarty.vim"
if filereadable($HOME."/.vim/colors/moriarty.vim")
	colorscheme moriarty
endif

" all sets
set backspace=indent,eol,start
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set number linebreak
" fold the code
set foldmethod=syntax
set colorcolumn=81
" hi colorcolumn ctermbg=Red guibg=LightBlue

" set cursor line
set cursorline " underline the line where cursor is in
hi CursorLine cterm=underline gui=underline " ctermfg=White

" Search settings
set hlsearch " highlight all matches of a search
set incsearch " searches as you type

" Set encryption method
set cm=blowfish2

" key mappings
nmap <F8> :TagbarToggle<CR>
"press <fn>+F8

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" vim-syntatic starter settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" let g:syntastic_python_python_exe = 'python3'
" let g:syntastic_python_checkers = ['python', 'py3kwarn']
