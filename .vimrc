set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=3
set relativenumber
set laststatus=2
call plug#begin('~/.vim/plugged')
"syntax 
Plug 'sheerun/vim-polyglot'
"themes
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'wdhg/dragon-energy'
Plug 'victorze/foo'

Plug 'luochen1990/rainbow'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"icon
Plug 'ryanoasis/vim-devicons'
Plug 'Lokaltog/powerline'     
"ide
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/dein.vim'
Plug 'Shougo/defx.nvim',{ 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim',{ 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs'
call plug#end()

set termguicolors

set termencoding=utf-8
let g:airline_theme='distinguished'
let g:airline_powerline_fonts = 1
"let ayucolor="light"
let mapleader=","

syntax enable
set background=dark
colorscheme hyper

"""" Configuracion de easymotion
"Moverme a una linea
map  <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>p <Plug>(easymotion-overwin-line)

nmap <Leader>s <Plug>(easymotion-s2)

"""" Configuracion nerdtree
"CR significa enter, abre la consola y escribe eso :0
nmap <Leader>n :NERDTreeFocus<CR> 
"C-n siginifica, C = Ctrl, n es la letra que acompaña
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"" Personalizado
nmap <C-w> :w!<CR>
nmap <C-q> :q!<CR>
nmap <C-c> :wq!<CR>

map <C-z> gT
map <C-x> gt
":imap ii <Esc>

"""" CONFIG GOLANG

filetype plugin indent on

set autowrite

"Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

"Auto formatting and importing
"let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

  " Status line types/signatures
"let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

"Map keys for most used commands.
"Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r :GoRun 
autocmd FileType go nmap <leader>t <Plug>(go-test)
"Auto Pairs {} []
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairsFlyMode=1



