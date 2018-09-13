call plug#begin('~/.config/nvim/plugged')

" Fuzzy Finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" ColorScheme
Plug 'junegunn/seoul256.vim'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'carlitux/deoplete-ternjs'

" Snippets
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

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

" Vim-Go
Plug 'fatih/vim-go'

call plug#end()