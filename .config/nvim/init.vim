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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

" Functions
function! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfunction
" Show hover, else pull up Vim help
function! s:ShowDocumentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
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
tnoremap <Esc> <C-\><C-n>
nnoremap ; :
nnoremap : ;
nnoremap Y y$
nnoremap U <C-r>
nnoremap <silent> <C-n> :enew<CR>
nnoremap <Leader><Space> i<Space><Esc>
nnoremap <Leader>b :ls<CR>:b
nnoremap <silent> <Leader>t	:split term://zsh<CR>
nnoremap <silent> <Esc> :noh<CR>
nnoremap <silent> <Leader>e :Files<CR>
nnoremap <silent> <Leader>gg :G<CR>
" Better navigation mappings
nnoremap <M-Left> <C-w>h
nnoremap <M-Down> <C-w>j
nnoremap <M-Up> <C-w>k
nnoremap <M-Right> <C-w>l
nnoremap <M-x> <C-w>x
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprevious<CR>
" Code mappings
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gr <Plug>(coc-references)
nmap <Leader>gi <Plug>(coc-implementation)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>do <Plug>(coc-codeaction)
nnoremap <Leader>fv :CocSearch <C-r>=expand("<cword>")<CR><CR>
nnoremap <silent> K :call <SID>ShowDocumentation()<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"
nnoremap <silent> <F5> :split term://zsh -c 'g++ % && ./a.out'<CR>

" Plugin configurations
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
let g:rooter_change_directory_for_non_project_files = 'current'
let g:fzf_layout = { 'down': '~30%' }
let $FZF_DEFAULT_COMMAND='rg --files -g \!.cache -g \!.mozilla -g\!node_modules'
