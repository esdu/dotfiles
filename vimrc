" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Prevent vim from emulating the original vi's bugs and limitations.
set nocompatible

" Load all bundles
call pathogen#runtime_append_all_bundles()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set so=7

set t_Co=256 " This messes up old mac terminal
colo molokai
" desert, molokai, zenburn, ir_black are good.
" wombat
" wombat256
" xoria256

" let g:lucius_style="light"
" colo lucius

" syntax enable
" set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized

" Line margins.
set scrolloff=8

" Show col number
set ruler

" Highlight long lines
match ErrorMsg '\%>80v.\+'

set hlsearch

set winheight=30
set winwidth=85

" Set command window height to reduce number of 'Press ENTER...' prompts
set cmdheight=2

" Better window splitting start locations
set splitbelow
set splitright

" Lets vim set the title of the console
set title

" Paste/edit/normal modes
set showmode

" show matching brace/paren
set showmatch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"
" Faster Interaction ***********************************************************
"

" Jump to last location when re-opening file
:au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Tabbing made easy.
nmap = :tabn<CR>
nmap - :tabp<CR>

" Matchit - {going back and forth between these braces}
:source $VIMRUNTIME/macros/matchit.vim
set cpoptions+=$

" Cutting chunks.
" set virtualedit=all

" Omnicompletion
filetype plugin on
set ofu=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" line numbers
set number

" incremental search when using '/' command
set incsearch

" case-insensitive search
set ignorecase

" Opening and closing braces inserted upon pressing { in insert mode
" this should be more sophisticated, preferrably scripted instead of simple mapping
inoremap {<CR> {<CR>}<Left><CR><Up><Tab>
inoremap {<Space> {<Space>}<Left><Left>

" Map semicolon to colon in normal mode
nnoremap ; :

" allow mouse to be used
set mouse=a

" Use ctrl+hjkl to nav between split windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" When editing file requiring root privileges, but forgot to sudo
cnoremap w!! w !sudo tee % >/dev/null

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"
" Staying Safe & Staying Sane **************************************************
"

" Trim trailing white spaces upon save
autocmd BufWritePre * :%s/\s\+$//e

" indentation and such
set expandtab
set autoindent
set smartindent
set ts=2 sts=2 et sw=2

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" but disable tab special chars in html and xml files
autocmd filetype html,xml set listchars-=tab:>.

" Python specific settings
autocmd filetype python set ts=4 sts=4 et sw=4
autocmd filetype coffeescript set ts=2 sts=2 et sw=2

" make vertical split open window to the right
set splitright

" let j k go down and up by display lines instead of real lines
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Mapping file types
au BufRead,BufNewFile *.erb set filetype=erb
au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile *.coffee set filetype=coffee
au! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax
au! BufRead,BufNewFile *.html.erb set filetype=eruby.html
au! BufRead,BufNewFile *.hbs set filetype=handlebars.html
au! BufRead,BufNewFile *.ex set filetype=elixir

" Turn off that annoying bell
set vb t_vb=

" Automatically read the latest files from disk
set autoread

" Automatically write the latest bugger to file when switched to it
set autowrite

" Store temporary files in a central spot
" Check if the backup directory exists; if it doesn't, create it
set backupdir=~/.vim_backups//
silent execute '!mkdir -p ~/.vim_backups'
set directory=~/.vim_backups//

" Remember more history & undos
set history=1000
set undolevels=1000

" Silently save folds.
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview






" Nerdtree

" show hidden files in nerdtree
let NERDTreeShowHidden=1
" toggle with ctrl n
map <C-n> :NERDTreeToggle<CR>






" Status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0





"" Helpers

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction


