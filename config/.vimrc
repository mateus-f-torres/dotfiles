set nocompatible        " dont try to be vi
set ff=unix             " see DOS's ^M

" Colors {{{
set background=dark
colorscheme solarized8_flat
syntax enable           " enable syntax processing
set laststatus=2        " make lightline visible
set noshowmode	      	" disable default INSERT text
let g:lightline = {	
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly',  'filename', 'modified' ] ],
  \
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype' ] ],
  \ },
  \ 'component_function': {
  \   'gitbranch':  'fugitive#head'
  \ },
  \ }		              	
" }}}

" Keys {{{
set backspace=0         " dont cross lines
let mapleader = ","
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprevious<cr>
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprevious<cr>
" }}}

" Spaces & Tabs {{{
set expandtab           " use spaces for tabs
set softtabstop=2       " 2 space tab when in insert/replace mode
set shiftwidth=2        " 2 spaces for shift > < indenting
filetype indent on    	" load filetype-specific indent files
filetype plugin on    	" load filetype-specific plugin files
" }}}

" UI Layout {{{
set number              " show line numbers
set showcmd             " show typed command in bottom right bar
set wildmenu	        " visual autocomplete for command menu
set lazyredraw	      	" redraw only when we need to
" }}}

" Searching {{{
" Files
set path+=src/**        " search every subfolder
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
set ignorecase          " ignore case when searching
" :find Component.*     " fuzzy find every match
" :b [file.substring]   " open matching file from buffer, can fuzzy too
" }}}

" Tags Jumping {{{
" ^ means Crtl
" install ctags
" in root of project
" ctags -R
" see if tags file was created
" To jump in ^]
" to jump out ^t
" to see ambiguous tags g^]
" }}}

" Autocomplete {{{
set completeopt=longest,menuone
set pumheight=15        " popup menu height
set pumwidth=15         " popup menu width
" ^n                    " show menu of choices
" ^x^n                  " current file choices
" ^x^f                  " filenames choices (from root)
" ^x^]                  " for tags choices
" in menu... ^n to forwards and ^p to backwards
" }}}


" Snippets {{{
" concatenate snippets into files
nnoremap <leader>html :-1read $HOME/.vim/.skeleton.html<CR>
" maybe config so that [html] declarative finds right file
" .skeleton are simple text files
" n = normal mode
" no = dont invoke other command
" remap = remap
" <leader> = defaults to \
" html = my mapping of choices
" : = change to command mode
" -1 = dont insert extra lines
" read = read file content into current file in buffer
" $HOME/.vim/.skeleton.html = path/to/file
" <CR> = ENTER command i.e carriage return
" }}}

" Registry {{{
" dd  will delete a line into the default register
" "add will delete a line into the a register
" "bdd will delete a line into the b register
" "ap will paste a line from the a register
" the + register is connected to the system clipboard
" so "+yy will copy a line into the system clipboard
" and "+p will put a line from the system clipboard
" }}}

" Help {{{
" :help i_^n or :help i_CTRL-N
" what does Crtl N does in INSERT mode
" :helpgrep
" :cl   to see list
" :cn   to next
" :cp   to prev
" :cc[n] to goto list number n
" }}}

" Folding {{{
set foldenable          " don't fold files by default on open
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldlevelstart=10   " open most folds by default
" }}}

" Asynchronous Lint Engine (ALE)
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
inoremap <C-c> <Esc>
" remap ^c to trigger ale lint autocmd on insert leave
let g:ale_sign_error = "◉"
let g:ale_sign_warning = "◉"
highlight link ALEErrorSign    Error
highlight link ALEWarningSign  WarningMsg
" to set manually
" cterm=vim gui=gvim fg=foreground bg=background
" highlight ALEErrorSign ctermfg=9 ctermbg=15 guifg=#C30500 guibg=#F5F5F5
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_info_str = 'I'
let g:ale_echo_msg_format = '%linter%: %code% %severity% -> %s'
nnoremap <leader>af :ALEFix<cr>
nnoremap <leader>ad :ALEDetail<cr>
nnoremap <leader>at :ALEToggle<cr>
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
let g:ale_linters = { 'javascript': ['eslint'], 'css': ['stylelint'] }
let g:ale_fixers = { 'javascript': ['prettier', 'eslint'], 'css': ['stylelint'] }

" NERDTree
nnoremap <leader>tr :NERDTreeToggle<CR>

" GitGutter
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk

" function by MILOSZ GALAZKA 
function! ToggleTheme()
  let &background = ( &background == "dark"? "light" : "dark" )
  if exists("g:lightline")
    runtime autoload/lightline/colorscheme/solarized.vim
    call lightline#colorscheme()
  endif
endfunction
map <F12> :call ToggleTheme()<CR>

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
