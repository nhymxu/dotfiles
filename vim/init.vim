" Install plugins
call plug#begin()
" Looks
Plug 'nikitavoloboev/vim-monokai-night' " Theme
Plug 'itchyny/lightline.vim' " Light and configurable statusline/tabline plugin.

" Utility
Plug 'romainl/vim-cool' " Stop matching after search is done.
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair..
Plug 'jremmen/vim-ripgrep' " Use RipGrep in Vim and display results in a quickfix list.

Plug 'scrooloose/nerdcommenter' " Quick comments.
Plug 'unblevable/quick-scope' " Highlight f, F jumps.
Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Interactive command execution.
Plug 'tpope/vim-repeat' " Enable repeating supported plugin maps.
Plug 'tpope/vim-surround' " Quoting/parenthesizing made simple.
Plug 'junegunn/vim-easy-align' " Simple, easy-to-use alignment.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fzf search. 
Plug 'junegunn/fzf.vim' " Fzf search.
Plug 'haya14busa/incsearch.vim' " Improved incremental searching.
Plug 'easymotion/vim-easymotion' " Vim motions on speed.
Plug 'thinca/vim-quickrun' " Run commands quickly.

" Git
Plug 'tpope/vim-fugitive' " Git wrapper.
Plug 'mhinz/vim-signify' " Show a diff using Vim its sign column.

call plug#end()

" Options

set nocompatible " Use vim settings, rather then vi settings (much better!)

set mouse=a " Copy selected text with mouse to system clipboard
set undofile " Save undos after file closes
set wildmode=longest:list,full " Complete longest common string, then each full match
set updatetime=250 " If this many milliseconds nothing is typed the swap file will be written to disk
set visualbell " Turn off the audio bell (no beeps)
set clipboard^=unnamed  " Make yanking copy to clipboard
set gdefault " Always do global substitutions
set title " Set terminal title
set whichwrap+=<,>,[,]
set completeopt-=preview " No annoying scratch preview above
set expandtab " Spaces on tabs
set shiftwidth=4
set softtabstop=2
set undolevels=1000
set smartindent " Indentation
set shortmess=Ia " Disable startup message
set fileencoding=utf-8 " Encoding when written to file
set fileformat=unix " Line endings
set timeout timeoutlen=1000 ttimeoutlen=10 " TODO: ?
set autowrite " Automatically save before :next, :make etc
set ignorecase " Search case insensitive:
set smartcase " .. but not when search pattern contains upper case characters
set nocursorcolumn
set nocursorline
set number
set wrap
set textwidth=79
set formatoptions=qrn1
set notimeout
set ttimeout
set ttimeoutlen=10
set nobackup " Don't create annoying backup files
set path=+** " Search down into subfolders

" Folding
set foldcolumn=1
set foldlevel=20
set foldlevelstart=7
set foldmethod=syntax
set foldignore=""
set nofoldenable

" Buffers
set hidden

" Searching
set wrapscan
set ignorecase
set smartcase

" Usable 'Tab'
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" UI
set cursorline  " Highlight current line
set showmatch
set tabstop=4 " Default indentation is 4 spaces long and uses tabs, not spaces
set matchtime=2
set laststatus=2
" set termguicolors " Enable true colors support
let python_highlight_all = 1