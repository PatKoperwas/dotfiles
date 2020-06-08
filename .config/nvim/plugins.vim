call plug#begin('~/.config/nvim/plugged')

" Fuzzy Finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" ColorScheme
Plug 'junegunn/seoul256.vim'

" Golang
Plug 'fatih/vim-go'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Typescript
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" Prettify
" Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'

" Javascrip
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'

" Testing
Plug 'janko-m/vim-test'

" Easily interact with tmux from vim
Plug 'benmills/vimux'

" Argument wrapping and unwrapping extension
Plug 'foosoft/vim-argwrap'

"File system explorer for the Vim editor
Plug 'scrooloose/nerdtree'

" Vim sugar for the UNIX shell commands that need it the most
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'

" Vim-Go
Plug 'fatih/vim-go'

" Comment Stuff out
Plug 'tomtom/tcomment_vim'

" Ruby
Plug 'vim-ruby/vim-ruby'

" Rust
Plug 'rust-lang/rust.vim'

" ReasonML
" Plug 'reasonml-editor/vim-reason-plus'

" Plug 'autozimu/LanguageClient-neovim', {
"   \ 'branch': 'next',
"   \ 'do': 'bash install.sh',
"   \ }
"
call plug#end()

