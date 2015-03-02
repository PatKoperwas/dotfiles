let g:gruvbox_italic=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set hidden
set history=10000
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase
set cursorline
set ruler
set number
set cmdheight=1
set switchbuf=useopen
set numberwidth=6
set showtabline=2
set winwidth=90

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

set scrolloff=3
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backspace=indent,eol,start
set showcmd

set colorcolumn=80
syntax on
filetype plugin indent on
set wildmode=longest,list
set wildmenu
let mapleader = "\\"

" MOTIONS
" ------
nmap k gk
nmap j gj
set pastetoggle=<leader>p

" VUNDLE
" -----
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'airblade/vim-gitgutter'
Bundle 'guns/vim-clojure-highlight'
Bundle 'guns/vim-clojure-static'
Bundle 'itchyny/lightline.vim'
Bundle 'jgdavey/tslime.vim'
Bundle 'junegunn/vim-easy-align'
Bundle 'kana/vim-textobj-user'
Bundle 'morhetz/gruvbox'
Bundle 'mxw/vim-jsx.git'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'ngmy/vim-rubocop'
Bundle "pangloss/vim-javascript"
Bundle 'scrooloose/nerdtree'
Bundle 'skalnik/vim-vroom'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'wincent/command-t'

" CUSTOM AUTOCMDS
" ---------------
augroup vimrcEx
" Jump to last cursor position unless it's invalid or in an event handler
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif
        
    "for ruby, autoindent with two spaces, always expand tabs
    autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et

    autocmd BufRead, BufNewFile *.sass setfiletype sass
augroup END

autocmd Filetype gitcommit setlocal spell textwidth=72
au BufRead,BufNewFile *.md setlocal textwidth=80
autocmd BufRead,BufNewFile *.md setlocal spell


" COLOR
" ----
set t_Co=256 
set background=dark
colorscheme gruvbox
let g:gruvbox_termcolors=16

" STATUS LINE
" -----------
let g:Powerline_symbols = 'fancy'
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" MISC KEY MAPS
" -------------
nmap <leader>w :w!<cr>

" Switch back to previous file
nnoremap <leader><leader> <c-^>

" Strip trailing whitespace
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Control-C to return to Command Mode
imap <c-c> <esc>

" Clear the search buffer when hitting return
function! MapCR()
    nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
" ----------------------------------------------------------------
 function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
       return "\<tab>"
    else
       return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" MAPS TO JUMP TO SPECIFIC COMMAND-T TARGETS AND FILES
" ----------------------------------------------------
map <leader>gr :topleft :split config/routes.rb<cr>
function! ShowRoutes()
    "
:topleft 100 :split __Routes__
" Make sure Vim doesn't write __Routes__ as a file
:set buftype=nofile
" Delete everything
:normal 1GdG
" Put routes output in buffer
:0r! bundle exec rake -s routes
" Size window to number of lines (1 plus rake output length)
:exec ":normal " . line("$") . _ "
" Move cursor to bottom
:normal 1GG
" Delete empty trailing line
:normal dd
endfunction

map <leader>gR :call ShowRoutes()<cr>
map <leader>ga :CommandTFlush<cr>\|:CommandT app/assets<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT spec/<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT config<cr>
map <leader>gf :CommandTFlush<cr>\|:CommandT features<cr>
map <leader>gg :topleft 20 :split Gemfile<cr>
map <leader>gt :CommandTFlush<cr>\|:CommandTTag<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

let g:CommandTMaxFiles=40000
let g:CommandTMatchWindowReverse = 1
let g:CommandTWildIgnore=&wildignore . ",**/node_modules/*,tmp/*"

" Files and backups
" -----------------
" Turn backup off, 
set nobackup
set nowb
set noswapfile

" Plugins
" ------------

" Vroom
let g:vroom_detect_spec_helper = 1
let g:vroom_use_spring = 1
let g:vroom_use_binstubs = 1
let g:vroom_cucumber_path = 'cucumber'

" LightLine
let g:lightline = {
  \
  \ }

" Ruby Blocks
runtime macros/matchit.vim

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" Rubocop
let g:vimrubocop_config = '.rubocop.yml'
let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop '
nmap <Leader>c :RuboCop<CR>

" Easy Align
vmap <Enter> <Plug>(EasyAlign)

" RSpec
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
"let g:rspec_command = 'call Send_to_Tmux("ruby {spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
