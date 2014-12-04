let g:gruvbox_italic=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=10000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
"Always show current position
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
" keep more context when scrolling off the end of a buffer
set scrolloff=3
" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd

" Additional CTags
set tags +=/usr/local/rbenv/versions/1.9.3-p327/lib/ruby/gems/1.9.1/gems/tags

set colorcolumn=80
" Enable highlighting for syntax
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
let mapleader = "\\"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MOTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap k gk
nmap j gj

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
Bundle 'airblade/vim-gitgutter'
Bundle 'guns/vim-clojure-static'
Bundle 'guns/vim-clojure-highlight'
Bundle 'morhetz/gruvbox'
Bundle 'itchyny/lightline.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'ngmy/vim-rubocop'
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256 " 256 colors
set background=dark
colorscheme gruvbox
let g:gruvbox_termcolors=16

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Powerline_symbols = 'fancy'
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saving
nmap <leader>w :w!<cr>

" Switch back to previous file
nnoremap <leader><leader> <c-^>

" Strip trailing whitespace
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Timestamp
nmap <F6> a<C-R>=strftime("%Y-%m-%d %I:%M:%S")<CR><Esc>
imap <F6> <C-R>=strftime("%Y-%m-%d %I:%M:%S")<CR>

" Control-C to return to Command Mode
imap <c-c> <esc>

" Clear the search buffer when hitting return
function! MapCR()
    nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" " Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPS TO JUMP TO SPECIFIC COMMAND-T TARGETS AND FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gr :topleft :split config/routes.rb<cr>
function! ShowRoutes()
" Requires 'scratch' plugin
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

let g:vroom_detect_spec_helper = 1
let g:vroom_use_spring = 1
let g:vroom_use_binstubs = 1
let g:vroom_cucumber_path = 'cucumber'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>p :execute "normal ^^Orequire 'pry-remote';"<CR>
nnoremap <leader>v :execute "normal ^^O<% require 'pry-remote'; %>"<CR>

"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LightLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
  \
  \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ruby Blocks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime macros/matchit.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rubocop
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimrubocop_config = '.rubocop.yml'
let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop '
nmap <Leader>c :RuboCop<CR>
