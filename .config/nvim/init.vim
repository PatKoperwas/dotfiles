" Plugins ---------------------------------------------------------------------
if filereadable(expand("~/.config/nvim/plugins.vim"))
  source ~/.config/nvim/plugins.vim
endif

" Tabs and spaces -------------------------------------------------------------
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
set expandtab
set autoindent
set smarttab

" Basic Editing Configuration -------------------------------------------------
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set cmdheight=2
set colorcolumn=80
set conceallevel=0
set cursorline
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set hidden
set history=10000
set hlsearch
set ignorecase smartcase
set incsearch
set laststatus=2
set noswapfile
set number
set numberwidth=6
set pastetoggle=<leader>p
set ruler
set scrolloff=3
set signcolumn=yes
set shiftwidth=2
set shortmess+=c
set showcmd
set showmatch
set showtabline=0
set statusline=%f
set switchbuf=useopen
set t_ti= t_te= " Prevent Vim from clobbering the scrollback buffer.
set title
set timeoutlen=1000 ttimeoutlen=0
set updatetime=300
set wildmenu
set wildmode=longest,list
set winwidth=90

" Color -----------------------------------------------------------------------
set t_Co=256
"let g:seoul256_background = 233
"colo seoul256
"colo purpleish
colo vividchalk
highlight MatchParen ctermbg=black

" Motions & Key Maps ----------------------------------------------------------
" Map Leader Key to space
let mapleader = "\<Space>"
" nmap <Blash> <Space>

" Move by wrapped line
nmap k gk
nmap j gj

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Switch back to previous file
nnoremap <leader><leader> <c-^>

" Clear search with enter
nnoremap <cr> :nohlsearch<cr>

" Save shortcut
nmap <leader>w :w!<cr>

" Make Y behave the same as C and D
noremap Y y$

" Toggle Fold
nmap \ za

" Custom Autocmds -------------------------------------------------------------
filetype plugin indent on

augroup indentation
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif

    " for ruby, autoindent with two spaces, always expand tabs
    autocmd FileType elm,ruby,haml,eruby,yaml,html,javascript,sass,cucumber,yml set ai sw=2 sts=2 et

    " for go
    au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
augroup END

" Markdown settings
augroup markdown
  autocmd Filetype markdown setlocal spell
  au BufRead,BufNewFile *.md setlocal textwidth=80
  autocmd BufRead,BufNewFile *.md setlocal spell
augroup END

" Git commit messages
augroup gitCommit
  autocmd Filetype gitcommit setlocal spell textwidth=72
augroup END

" Remove trailing whitespace on save
augroup trailingWhitespace
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

" Filetyped
augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" Deoplete Window
function! Preview_func()
	if &pvw
		setlocal nonumber norelativenumber
	endif
endfunction
autocmd WinEnter * call Preview_func()


" FZF -------------------------------------------------------------------------
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 20 :split Gemfile<cr>

map <Leader>f :Files<CR>
map <Leader>ga :Files app/<CR>
map <Leader>gv :Files app/views<CR>
map <Leader>gc :Files app/controllers<CR>
map <Leader>gm :Files app/models<CR>
map <Leader>gh :Files app/helpers<CR>
map <leader>gs :Files spec/<cr>
map <leader>gl :Files lib<cr>
map <leader>gp :Files config<cr>
map <leader>gf :Files spec/features<cr>
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


" CoC -------------------------------------------------------------------------
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Set filetype for .jsx and .tsx files
augroup ReactFiletypes
  autocmd!
  autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
  autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
augroup END

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" " Tern ------------------------------------------------------------------------
" let g:tern_request_timeout = 1
" let g:tern_request_timeout = 6000
" let g:tern#command = ["tern"]
" let g:tern#arguments = ["--persistent"]
" let g:deoplete#sources#tss#javascript_support = 1
"

" vim-test --------------------------------------------------------------------
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
let test#strategy = "vimux"
let g:test#preserve_screen = 1
" let test#strategy = "vimux"
" let test#go#gotest#options = '-v'


" Nerd Tree -------------------------------------------------------------------
map <C-n> :NERDTreeToggle<CR>


" Vim Go ----------------------------------------------------------------------
" au FileType go nmap <leader>r <Plug>(go-run)
" au FileType go nmap <leader>b <Plug>(go-build)
" au FileType go nmap <leader>t <Plug>(go-test-func)
" au FileType go nmap <leader>c <Plug>(go-coverage)
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


" Ale -------------------------------------------------------------------------
let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'jsx': ['eslint'],
\  'tsx': ['prettier'],
\  'typescriptreact': ['prettier'],
\  'ruby': ['rubocop'],
\}

let g:ale_linters = {
\ 'ruby': ['rubocop'],
\}

let g:ale_fix_on_save = 0


" Ruby ------------------------------------------------------------------------
let ruby_fold = 1
let ruby_foldable_groups = 'def'
let g:ruby_indent_assignment_style = 'variable'


" Rust ------------------------------------------------------------------------
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" Svelte ------------------------------------------------------------------------
let g:vim_svelte_plugin_use_typescript = 1
