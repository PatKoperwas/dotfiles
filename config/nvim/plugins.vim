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

" Snippet
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" Prettify
Plug 'sbdchd/neoformat'

" Javascript
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'

" Testing
Plug 'janko-m/vim-test'

" Vim + Tmux
Plug 'benmills/vimux'

" Wrap args
Plug 'foosoft/vim-argwrap'

" NerdTree
Plug 'scrooloose/nerdtree'

call plug#end()
