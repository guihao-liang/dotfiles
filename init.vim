" echo $HOME."/.vim/colors/moriarty.vim"
if filereadable($HOME."/.config/nvim/colors/moriarty.vim")
    colorscheme moriarty
endif

if &compatible
    set nocompatible               " Be iMproved
endif

" pyenv global both 2 and 3; then rehash
let g:python_host_prog = $HOME.'/.pyenv/shims/python2'
let g:python3_host_prog = $HOME.'/.pyenv/shims/python3'

"----------------------------dein Scripts-----------------------------
" Required:
set runtimepath+=$HOME/.config/nvim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state($HOME.'/.config/nvim')
    call dein#begin($HOME.'/.config/nvim')

    " Let dein manage dein
    " Required:
    call dein#add($HOME.'/.config/nvim/repos/github.com/Shougo/dein.vim')

    " Add or remove plugins here:
    call dein#add('bling/vim-airline')
    call dein#add('christoomey/vim-tmux-navigator')
    call dein#add('Konfekt/FastFold')
    call dein#add('scrooloose/nerdtree', { 'on_cmd': 'NERDTreeToggle' })
    call dein#add('scrooloose/syntastic')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/neopairs.vim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/context_filetype.vim')
    call dein#add('tpope/vim-commentary')
    call dein#add('tpope/vim-sensible')
    call dein#add('tpope/vim-repeat')
    call dein#add('tpope/vim-surround')
    call dein#add('wellle/tmux-complete.vim')

    " code snippets
    call dein#add('honza/vim-snippets')

    " specify revision/branch/tag.
    call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

    " lang specific
    call dein#add('fatih/vim-go', { 'on_ft': 'go'})
    " call dein#add('python-mode/python-mode', { 'on_ft': 'python' })
    call dein#add('octol/vim-cpp-enhanced-highlight', { 'on_ft': 'cpp' })

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif

"--------------------------End dein Scripts----------------------------

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#min_pattern_length = 3
" Use tmux-complete
let g:tmuxcomplete#trigger = ''

" neosnippet setting
imap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <C-f>  <Plug>(neosnippet_expand_or_jump)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Searching
set ignorecase
set showmatch
set hlsearch " highlight all matches of a search
set incsearch " searches as you type
set timeoutlen=300

" set cursor line
set cursorline " underline the line where cursor is in
hi CursorLine cterm=underline gui=underline " ctermfg=White

" editor basics
set backspace=indent,eol,start
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set number linebreak

" fold the code
set foldmethod=syntax
set colorcolumn=81
" Navigation
nnoremap <Leader>e :NERDTreeToggle<cr>
nnoremap <Leader>f :Files<cr>
nnoremap <Leader>g :grep<space>
nnoremap <Leader>b :Buffers<cr>

" practical vim
" filepath of active buffer but removing the filename.
" map %% to %:h.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' :'%%'

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
