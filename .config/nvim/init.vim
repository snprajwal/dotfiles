" Settings
set termguicolors
set hidden
set number
set relativenumber
set signcolumn=yes
set noshowmode
set nobackup
set noswapfile
set nowritebackup
set undofile
set updatetime=400
set nohlsearch
set ignorecase
set smartcase
set splitright
set splitbelow
set cursorline
set scrolloff=8
set mouse=a
set tabstop=4
set shiftwidth=4
set linebreak
set foldmethod=indent
set nofoldenable
set virtualedit=block
set gdefault
set clipboard+=unnamedplus
set path+=**
set wildmenu

" Plugins
call plug#begin("~/.config/nvim/plugged")
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

" Functions
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction
" Open terminal
function! OpenTerminal()
	split term://zsh
	resize 10
endfunction
" Trim trailing whitespace
function! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfunction

" Autocommands
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
augroup clean
	autocmd!
	autocmd BufWritePre * :call TrimWhitespace()
augroup end

" Keybindings
let mapleader = "\<Space>"
cabbrev vb vert sb
nnoremap ; :
nnoremap : ;
nnoremap Y y$
nnoremap U <C-r>
nnoremap <silent> <C-n> :enew<CR>
nnoremap <Leader><Space> i<Space><Esc>
nnoremap <Leader>b :ls<CR>:b
nnoremap <silent> <Leader>e :Files<CR>
nnoremap <silent> <Leader>f :GFiles<CR>
nnoremap <silent> <Leader>t :call OpenTerminal()<CR>
nnoremap <silent> <Leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <silent> <Esc> :noh<CR>
tnoremap <Esc> <C-\><C-n>
" Better navigation mappings
nnoremap <silent> <C-j> :resize -2<CR>
nnoremap <silent> <C-k> :resize +2<CR>
nnoremap <silent> <C-h> :vertical resize -2<CR>
nnoremap <silent> <C-l> :vertical resize +2<CR>
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <M-x> <C-w>x
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>
nnoremap <silent> <M-Right> :tabnext<CR>
nnoremap <silent> <M-Left> :tabprevious<CR>
" CoC bindings
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gr <Plug>(coc-references)
nmap <Leader>gi <Plug>(coc-implementation)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <Leader>fv :CocSearch <C-r>=expand("<cword>")<CR><CR>
" Completion
nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <silent> <expr> <C-Space> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

" Plugins
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
if !exists('g:airline_symbols') | let g:airline_symbols = {} | endif
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.dirty='⚡'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:fzf_layout = { 'down': '~30%' }
