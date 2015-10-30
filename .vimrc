"For Pathogen
filetype off
execute pathogen#infect()
filetype plugin indent on

syntax on
syntax enable

set splitright

"set number
set nowrap
set ts=4
set expandtab
set autoindent
set shiftwidth=4
set showmatch
set ruler
let python_highlight_all = 1
set backspace=2 "have to set backspace for some reason

map <F2> :NERDTreeToggle<CR> 
map <F3> :TlistToggle<CR>
map <F4> :TaskList<CR>
map <buffer> <F5> :exec '!python' shellescape(@%, 1)<CR>
map <F7> :norm ^xx<CR> 
map <F8> :norm I# <CR> 
map <F9> :norm I% <CR>
map <F11> :20vsp /home/mr_user/.vim/vim_command_notes<CR>

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

let $Tlist_Ctags_Cmd='/usr/local/bin/ctags'

"The below are already accomplished with the miniBufExpl settings above
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>


" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

let g:pymode_run=1
let g:pymode_run_bind='<leader>r'
let g:pymode_options_colorcolumn = 0
let g:pymode_python='python3'

"NerdTree Settings
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Octave syntax 
augroup filetypedetect 
au! BufRead,BufNewFile *.m,*.oct set filetype=octave 
augroup END 
