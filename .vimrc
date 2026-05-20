" Visual settings
set cursorcolumn
hi CursorColumn ctermbg=6
hi Cursor guifg=white guibg=black
set cursorline
set laststatus=2
set t_Co=256
set nocompatible
filetype off
set encoding=utf-8
set backspace=indent,eol,start

" WSL-specific settings
set clipboard=unnamedplus
set mouse=a

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin manager
Plugin 'VundleVim/Vundle.vim'

" Essential plugins
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dense-analysis/ale'
Plugin 'nvie/vim-flake8'

" Completion - choose one:
" Option A: CoC (easier to install)
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" Option B: YouCompleteMe (uncomment if you prefer, comment out CoC)
" Plugin 'valloric/youcompleteme'

call vundle#end()
filetype plugin indent on

" Filetype-specific completions
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType css setl ofu=csscomplete#CompleteCSS
au FileType python setl ofu=pythoncomplete#Complete

" Indentation settings for common languages
au BufNewFile,BufRead *.py,*.php,*.rb,*.html,*.js,*.ts,*.md
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" CSS/JSON indentation
au BufNewFile,BufRead *.css,*.scss,*.json
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Python syntax highlighting
let python_highlight_all=1
syntax on

" Flagging unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" YouCompleteMe settings (if using YCM)
" let g:ycm_python_binary_path = 'python3'
" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]

" NERDTree settings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_console_startup=0
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0
let g:airline_theme='base16_spacemacs'

" Popup menu colors
highlight Pmenu ctermfg=0 ctermbg=4 guifg=#85becc guibg=#85becc

" ALE linter settings
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\}
let g:ale_fixers = {
\   'python': ['black', 'isort'],
\   'javascript': ['prettier'],
\}
