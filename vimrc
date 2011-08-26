" This setting prevents vim from emulating the original vi's bugs and limitations.
set nocompatible

"
" Prettiness ******************************************************************
"

" Pathogen stuff (coffeescript, vimclojure, etc)
call pathogen#runtime_append_all_bundles()
filetype off " from http://blog.darevay.com/2010/10/how-i-tamed-vimclojure/
             " otherwise pathogen won't find this plugin!!
syntax on
filetype plugin indent on

" Colors!
set t_Co=256 " This messes up old mac terminal
" desert, molokai, zenburn, ir_black are good.

" Lucius
" ======
" let g:lucius_style="light"
colo lucius

" Solarized
" =========
" syntax enable
" set background=light
" let g:solarized_termcolors=256
" colorscheme solarized

" VimClojure
let vimclojure#WantNailgun = 0 " Using slime instead
let vimclojure#UseErrorBuffer = 1
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1
let vimclojure#DynamicHighlighting = 1

" Line margins.
set scrolloff=8

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

set expandtab
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" but disable tab special chars in html and xml files
autocmd filetype html,xml set listchars-=tab:>.

" Paste/edit/normal modes
set showmode

" show matching brace/paren
set showmatch

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

"
" Staying Safe & Staying Sane **************************************************
"

" Trim trailing white spaces upon save
autocmd BufWritePre * :%s/\s\+$//e

" indentation and such
set autoindent
set smartindent
set ts=2 sts=2 et sw=2

" Python specific settings
autocmd FileType python set ts=4 sts=4 et sw=4

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
