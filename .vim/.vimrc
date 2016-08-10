"List of plugins:
" - pathogen (disabled)
" - python-mode (has rope)
" - nerdtree (disabled) -> use :E instead (netrw)
" - ctags-5.8 -> taglist
" - debugger.vim (disabled?)
" - jedi-vim (disabled)
" - minibuf (disabled)
" - taglist 
" - tasklist
" - python_pydoc
filetype off
filetype plugin indent on
syntax on
syntax enable


function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        if expl_win_num != -1
            let cur_win_nr = winnr()
            exec expl_win_num . 'wincmd w'
            close
            exec cur_win_nr . 'wincmd w'
            unlet t:expl_buf_num
        else
            unlet t:expl_buf_num
        endif
    else
        exec '1wincmd w'
        Vexplore
        let t:expl_buf_num = bufnr("%")
    endif
endfunction

function! ToggleVimNotes()
    if exists("t:vim_notes_buf_num")
        let vim_note_win_num = bufwinnr(t:vim_notes_buf_num)
        if vim_note_win_num != -1
            exec vim_note_win_num . 'wincmd w'
            close
            unlet t:vim_notes_buf_num
        else
            unlet t:vim_notes_buf_num
        endif
    else
        :20vsp ~/linux_configs/.vim/vim_command_notes
        let t:vim_notes_buf_num = bufnr("%")
    endif
endfunction


set splitright

"set number
set nowrap
set ts=4
set tabstop=4
set expandtab
set autoindent
set shiftwidth=4
set showmatch
set ruler
let python_highlight_all = 1
set backspace=2 "have to set backspace for some reason
"set omnifunc=syntaxcomplete#Complete
"g/^\_s\+print/s/$/)/gc -> adds paren at all lines starting w/ print

nnoremap <leader>f :buffers<CR>
nnoremap <leader>s :so ~/.vimrc<CR>
map + 10<C-W>>
map - 10<C-W><
nmap <S-Enter> O<Esc>j
nmap <Enter> o<Esc>k
nmap <leader>b ipu.db  # @XXX<Esc>
" inoremap <C-Space> <C-x><C-o>
" map <F2> :NERDTreeToggle<CR> 
map <silent> <F2> :call ToggleVExplorer()<CR>
map <F3> :TlistToggle<CR>
map <F4> :TaskList<CR>
" <F5> for debug
map <buffer> <F5> :exec '!python3' shellescape(@%, 1)<CR> 
map <F7> :norm ^xx<CR> 
map <F8> :norm I# <CR> 
map <F9> :%s/^\(\s*print\)\s\+\(.*\)/\1(\2)<CR>
map <F11> :call ToggleVimNotes()<CR>
nmap nc :%s/\([,#]\{1}\)\(\S\)/\1 \2/g<CR>

" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1

let $Tlist_Ctags_Cmd='/usr/local/bin/ctags'

"The below are already accomplished with the miniBufExpl settings above
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

highlight clear SpellBad
highlight SpellBad term=underline cterm=underline ctermfg=5 gui=underline guifg=SlateBlue

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
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion = 0
" once autcomplete is done, close preview window
autocmd CompleteDone * pclose 
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = '<leader>d'
let g:pymode_rope_rename_bind = '<leader>n'
let g:pymode_rope_rename_module_bind = '<leader>nm'
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_bind = '<leader>ai'
let g:pymode_rope_extract = 1
let g:pymode_rope_extract_method_bind = '<leader>mm'
" let g:pymode_rope_change_signature_bind = '<leader>fs'

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 0
"let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_checker = "pyflakes"
" Auto check on save
let g:pymode_lint_write = 1
let g:pymode_lint_ignore="E302,E303,E221,E501,E402,E114,E116"

" Support virtualenv
let g:pymode_virtualenv = 0

" Enable breakpoints plugin
let g:pymode_breakpoint = 0
" let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 1

let g:pymode_run=1
let g:pymode_run_bind='<leader>r'
let g:pymode_options_colorcolumn = 1
let g:pymode_python='python3'

"NerdTree Settings
"let g:NERDTreeDirArrows = 1
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'

" Octave syntax 
augroup filetypedetect 
au! BufRead,BufNewFile *.m,*.oct set filetype=octave 
augroup END 

set fillchars+=vert:│
hi VertSplit ctermbg=Cyan ctermfg=NONE
hi ColorColumn ctermbg=Grey ctermfg=Black
"autocmd ColorScheme * highlight VertSplit cterm=None ctermfg=Cyan ctermbg=None

" vimdiff colorscheme
if &diff
    colorscheme late_evening
endif

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of browser
let g:netrw_browse_split = 2
let g:netrw_winsize = 15 
" let g:netrw_altv = 1 " changes from left to right split
" let g:netrw_preview=1

" Default to tree mode
let g:netrw_liststyle = 3
