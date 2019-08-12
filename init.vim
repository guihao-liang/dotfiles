" echo $HOME."/.vim/colors/moriarty.vim"
if filereadable($HOME."/.cache/dein/colors/moriarty.vim")
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
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state($HOME.'/.cache/dein')
    call dein#begin($HOME.'/.cache/dein')

    " Let dein manage dein
    " Required:
    call dein#add($HOME.'/.cache/dein/repos/github.com/Shougo/dein.vim')

    " Add or remove plugins here:
    call dein#add('bling/vim-airline')
    call dein#add('christoomey/vim-tmux-navigator')
    call dein#add('Konfekt/FastFold')
    " call dein#add('scrooloose/syntastic')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/neopairs.vim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/context_filetype.vim')
    call dein#add('tpope/vim-commentary')
    call dein#add('tpope/vim-sensible')
    call dein#add('tpope/vim-repeat')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-unimpaired')
    call dein#add('tpope/vim-projectionist')
    call dein#add('wellle/tmux-complete.vim')

    " code snippets
    call dein#add('honza/vim-snippets')

    " specify revision/branch/tag.
    call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

    " lang specific
    call dein#add('python-mode/python-mode', { 'on_ft': 'python' })
    call dein#add('octol/vim-cpp-enhanced-highlight', { 'on_ft': 'cpp' })
    " call dein#add('dag/vim-fish', { 'on_ft': 'fish' })
    " call dein#add('zchee/deoplete-clang', { 'on_ft': 'cpp' })
    " call dein#add('fatih/vim-go', { 'on_ft': 'go'})
    " call dein#add('zchee/deoplete-jedi', {'on_ft': 'python' })
    call dein#add('zxqfl/tabnine-vim')

    " file navigation
    call dein#add('scrooloose/nerdtree', { 'on_cmd': 'NERDTreeToggle' })
    call dein#add('ctrlpvim/ctrlp.vim')

    " git integration
    call dein#add("airblade/vim-gitgutter")
    call dein#add("tpope/vim-fugitive")

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
" Python-mode autocompletion conflict with deoplete
let g:pymode_python = 'python3'
let g:pymode_doc = 0
set completeopt=menu " no preview window
let g:pymode_rope_completion = 0 
let g:pymode_lint_chekers = ['pep8', 'pyflakes', 'mccabe']
" deoplete-clang
let g:deoplete#sources#clang#std#cpp = 'c++14'
if has('macunix')
    " need to make it more intelligent
    let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
    let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/include'
elseif has('unix')
    let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang-3.8.so.1'
    let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
endif

" neosnippet setting. intentional recursive mapping here
imap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <C-f>  <Plug>(neosnippet_expand_or_jump)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Searching
set smartcase
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
set tabstop=2
set shiftwidth=2
set expandtab
set number linebreak

" fold the code
set foldmethod=syntax
set colorcolumn=81

let mapleader = '-'
" Navigation
nnoremap <Leader>n :NERDTreeToggle<cr>
nnoremap <Leader>f :files<cr>
nnoremap <Leader>g :grep<space>
nnoremap <Leader>b :buffers<cr>

" practical vim
" filepath of active buffer but removing the filename.
" map %% to %:h.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' :'%%'

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

" ctrlp MacOSX/Linux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.d,*.o,*.pyc
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_working_path_mode = 'ra'

" ag and ctrlp
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" make
set makeprg=make\ -j8\ $@
nnoremap <F4> :make!<cr>

" guihaol customization
let mapleader = '-'
" edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

inoremap jk <esc>

iabbrev @@ guihaol@zillowgroup.com
