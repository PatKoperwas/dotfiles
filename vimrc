let g:gruvbox_italic=0
set nocompatible
filetype off

" Vim Plug --------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'benmills/vimux'
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go'
Plug 'foosoft/vim-argwrap'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'ngmy/vim-rubocop'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --gocode-completer' }
Plug 'vim-syntastic/syntastic'
Plug 'vundlevim/vundle.vim'
Plug 'Shougo/neocomplete.vim'


call plug#end()

filetype plugin indent on
syntax on

autocmd! bufwritepost .vimrc source %

" Basic Editing Configuration -------------------------------------------------
set autoindent
set backspace=indent,eol,start
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set cmdheight=1
set colorcolumn=80
set cursorline
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set expandtab
set hidden
set history=10000
set hlsearch
set ignorecase smartcase
set incsearch
set laststatus=2
set statusline=%f
set number
set numberwidth=6
set pastetoggle=<leader>p
set ruler
set scrolloff=3
set shiftwidth=2
set showcmd
set showmatch
set showtabline=0
set softtabstop=2
set switchbuf=useopen
set t_ti= t_te= " Prevent Vim from clobbering the scrollback buffer.
set title
set tabstop=2
set timeoutlen=1000 ttimeoutlen=0
set wildmenu
set wildmode=longest,list
set winwidth=90


" Color -----------------------------------------------------------------------
set background=dark
set t_Co=256
colorscheme gruvbox
let g:gruvbox_termcolors=16


" Motions & Key Maps ----------------------------------------------------------

" Map Leader Key to back-slash
let mapleader = " "

nmap k gk
nmap j gj

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Control-C to escape
imap <c-c> <esc>

" Switch back to previous file
nnoremap <leader><leader> <c-^>

" Search for word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" Strip trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <cr> :nohlsearch<cr>
nmap <leader>w :w!<cr>

" Close buffer without closing split
nmap ,d :b#<bar>bd#<CR>

" Custom Autocmds -------------------------------------------------------------
augroup vimrcEx
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif

    " for ruby, autoindent with two spaces, always expand tabs
    autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber,yml set ai sw=2 sts=2 et

    " for go
    au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

    autocmd BufRead, BufNewFile *.sass setfiletype sass
augroup END


" MD & Git --------------------------------------------------------------------
autocmd Filetype gitcommit setlocal spell textwidth=72
au BufRead,BufNewFile *.md setlocal textwidth=80
autocmd BufRead,BufNewFile *.md setlocal spell


" Multipurpose Tab Key --------------------------------------------------------
" Indent if we're at the beginning of a line. Else, do completion.
 function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
       return "\<tab>"
    else
       return "\<c-p>"
       " return "\<C-X>\<C-O>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>


" FZF -------------------------------------------------------------------------
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 20 :split Gemfile<cr>

map <Leader>f :FZF<CR>
map <Leader>ga :FZF app/assets<CR>
map <Leader>gv :FZF app/views<CR>
map <Leader>gc :FZF app/controllers<CR>
map <Leader>gm :FZF app/models<CR>
map <Leader>gh :FZF app/helpers<CR>
map <leader>gs :FZF spec/<cr>
map <leader>gl :FZF lib<cr>
map <leader>gp :FZF config<cr>
map <leader>gf :FZF spec/features<cr>
map <leader>q :bd!<CR>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>


" Files and backups  ----------------------------------------------------------
set nobackup
set nowb
set noswapfile


" Vim Go ----------------------------------------------------------------------
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test-func)
au FileType go nmap <leader>c <Plug>(go-coverage)
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


" " Lightline -------------------------------------------------------------------
let g:gitgutter_override_sign_column_highlight = 0
"
" let g:lightline = {
"       \ 'active': {
"       \   'right': [ ],
"       \ },
"       \ }
"

" Ruby Blocks -----------------------------------------------------------------
runtime macros/matchit.vim


" Nerd Tree -------------------------------------------------------------------
map <C-n> :NERDTreeToggle<CR>


" Rubocop ---------------------------------------------------------------------
let g:vimrubocop_config = '.rubocop.yml'
let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop '
nmap <Leader>c :RuboCop<CR>


" Easy Align ------------------------------------------------------------------
vmap <Enter> <Plug>(EasyAlign)


" vim-test --------------------------------------------------------------------
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
let test#strategy = "vimux"


" argwrap ---------------------------------------------------------------------
nnoremap <silent> <leader>a :ArgWrap<CR>
let g:argwrap_tail_comma = 1


" ctags -----------------------------------------------------------------------
:set tags=.git/tags


" pry & debugger --------------------------------------------------------------
function! Debugging(direction)
  let file_name = expand('%')
  let extension = split(file_name, "/")[-1]
  let html = matchstr(extension, "html")
  let js = matchstr(extension, "js")

  let @g = a:direction

  if html == "html"
    normal! @g <% require "pry"; binding.pry %>
  elseif js == "js"
    normal! @g debugger;
  else
    normal! @g require "pry"; binding.pry
  endif
endfunction
map <Leader>P :call Debugging("O")<cr>


" random commands -------------------------------------------------------------
:command! ChangeHashSyntax %s/:\([^ ]*\)\(\s*\)=>/\1:/g


" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
 "let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_vue_checkers = ['eslint']
let g:syntastic_ignore_files = ['**/*.html']
let g:syntastic_sass_checkers = ['sassc']
let g:syntastic_scss_checkers = ['sassc']

" closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.html.erb"


" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.go = '[^.[:digit:] *\t]\.'
