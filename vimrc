source ~/.vim/plugin/matchit.vim
source ~/.vim/plugin/minibufexpl.vim
let g:loaded_acp = 1
let g:loaded_taglist = 1

"Manage multiple buffers effectively
set hidden

"Colorscheme
colorscheme koehler

"Map leader character
let mapleader = "\\"

"Remap ` to '
nnoremap ` '
nnoremap ' `

"Longer history
set history=100

"Show Line Numbers
set number

"Intuitive backspacing in insert mode
set backspace=indent,eol,start

"Show/Hide Line Numbers (leader l)
nmap <silent> <leader>l :silent :set nonumber!<CR>

"Filetype highlighting and configuration
syntax on
filetype on
filetype plugin on
filetype indent on

"Omnicompletion colors
highlight Pmenu ctermbg=4 
highlight PmenuSel ctermbg=6 ctermfg=13

"Omnicompletion options
set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"Highlight search terms (leader n)
set hlsearch
set incsearch
nmap <silent> <leader>n :silent :nohlsearch<CR>

"Command completion useful
set wildmode=list:longest

"Show cursor position
set ruler

"Smart case search
set ignorecase
set smartcase

"Set terminal title
set title

"Scroll more lines
set scrolloff=5
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

"Set backup dir
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

"Show whitespace (leader s)
set listchars=tab:>-,trail:-,eol:¬
nmap <silent> <leader>s :set nolist!<CR>

"Tabs to spaces
set tabstop=4
set shiftwidth=4
set expandtab

"Change bell sound for visual blink
set visualbell

"MiniBufferExplorer (leader b)
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
map <Leader>b :TMiniBufExplorer<cr>

"TagList (leader ls)
map <Leader>ls :TlistToggle<cr>

"=================================
"	@@Filetypes	
"=================================
"Actionscript
au BufRead,BufNewFile *.as set filetype=actionscript
au! Syntax actionscript source ~/.vim/syntax/actionscript.vim
autocmd FileType actionscript set omnifunc=actionscriptcomplete#CompleteAS
autocmd FileType actionscript set dictionary=~/.vim/dict/actionscript.dic

"Python
au BufRead,BufNewFile *.py set filetype=python
au! Syntax python source ~/.vim/syntax/python.vim

"SCSS
au BufRead,BufNewFile *.scss set filetype=scss
au! Syntax scss source ~/.vim/syntax/scss.vim

"STML [Sunrise Toolkit Markup Language]
au BufRead,BufNewFile *.stml set filetype=html

"=================================
"	@@Templates
"=================================
function! LoadTemplate()
	  silent! 0r ~/.vim/skel/tmpl.%:e
	    " Highlight %VAR% placeholders with the Todo colour group
	    syn match Todo "%\u\+%" containedIn=ALL
	    endfunction
	    autocmd! BufNewFile * call LoadTemplate()
	    "Jump between %VAR% placeholders in Normal mode with
	    " <leader-p>
	    nnoremap <silent> <leader>p /%\u.\{-1,}%<cr>c/%/e<cr>
	    "Jump between %VAR% placeholders in Insert mode with
	    " <leader-p>
	    inoremap <silent> <leader>p <ESC>/%\u.\{-1,}%<cr>c/%/e<cr>
