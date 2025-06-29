" Settings
set termguicolors
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
set scrolloff=6
set mouse=a
set tabstop=4
set shiftwidth=4
set linebreak
set foldmethod=indent
set nofoldenable
set virtualedit=block
set gdefault
set clipboard+=unnamedplus

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

" Plugin configurations
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
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
let g:airline_symbols.dirty=' ⚡'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:rooter_change_directory_for_non_project_files = 'home'
let g:rooter_patterns = ['.git']

" Functions
"" Respect .gitignore in a git repo
function! ListFiles()
	echo FindRootDirectory()
	if empty(FindRootDirectory())
		execute 'Files'
	else
		execute 'GFiles'
	endif
endfunction
function! s:ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction
"" Used by coc.nvim for trigger completion
function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Autocommands
"" Transparency
autocmd VimEnter * hi Normal guibg=none ctermbg=none
autocmd VimEnter * hi SignColumn guibg=none ctermbg=none
autocmd FileType text,markdown let b:coc_enabled = 0
autocmd FileType text,markdown setlocal spell spelllang=en_gb
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
autocmd User CocStatusChange redraws

" Keybindings
let mapleader = "\<Space>"
cabbrev vb vert sb
tnoremap <Esc> <C-\><C-n>
nnoremap Y y$
nnoremap U <C-r>
nnoremap ; :
nnoremap : ;
nnoremap <Leader><Space> i<Space><Esc>
nnoremap <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>t	:split term://zsh<CR>
nnoremap <silent> <Esc> :noh<CR>
nnoremap <silent> <Leader>e :call ListFiles()<CR>
nnoremap <silent> <Leader>g :G<CR>
nnoremap <F5> :split term://g++ cp.cpp && ./a.out<CR>
"" Better navigation mappings
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <M-x> <C-w>x
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>
nnoremap <silent> <C-n> :tabnew<CR>
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprevious<CR>
"" Code mappings
nmap gd <Plug>(coc-definition)
nmap gt <Plug>(coc-type-definition)
nmap gf <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
nmap [e <Plug>(coc-diagnostic-prev)
nmap ]e <Plug>(coc-diagnostic-next)
nmap <Leader>rn <Plug>(coc-rename)
nmap <Leader>rf <Plug>(coc-refactor)
nmap <Leader>a <Plug>(coc-codeaction-cursor)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>qf  <Plug>(coc-fix-current)
nnoremap <Leader>fv :CocSearch <C-r>=expand("<cword>")<CR><CR>
nnoremap <silent> K :call <SID>ShowDocumentation()<CR>
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : CheckBackspace() ? "\<S-Tab>" : coc#refresh()
inoremap <silent> <expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"
" CoC floating window navigation
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
