" Author: Jose Garcia (JoseKilo) jose.eduardo.gd@gmail.com
" Source: https://github.com/JoseKilo/vimrc

" To meditate mindfully demands 'an open and receptive, nonjudgmental
" awareness of your present-moment experience'.

" language en_US.UTF-8
set nocompatible

" Auto installing Dein
let iCanHazDein=1
let dein_readme = expand('~/.vim/dein/repos/github.com/Shougo/dein.vim/README.md')
if !filereadable(dein_readme)
    echo "Installing Dein..."
    echo ""
    silent !mkdir -p ~/.vim/dein
    silent !git clone https://github.com/Shougo/dein.vim ~/.vim/dein/repos/github.com/Shougo/dein.vim
    let iCanHazDein=0
endif

" Call Dein
if has('vim_starting')
    set rtp+=~/.vim/dein/repos/github.com/Shougo/dein.vim
endif
call dein#begin(expand('~/.vim/dein'))

" is better if Dein rules Dein (needed!)
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc', {'build' : 'make'})

" Unite. The interface to rule almost everything
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/unite-outline')
call dein#add('tsukkee/unite-help')
call dein#add('osyo-manga/unite-quickfix')
call dein#add('osyo-manga/unite-fold')
call dein#add('tacroe/unite-mark')

" Color schemes
call dein#add('joedicastro/vim-molokai256')
call dein#add('sjl/badwolf')
call dein#add('nielsmadan/harlequin')
call dein#add('tpope/vim-vividchalk')

" Git
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')  " Changes in side bar
call dein#add('gregsexton/gitv', {'depends':['tpope/vim-fugitive'], 'on_cmd':'Gitv'})

" Custom Syntax
call dein#add('plasticboy/vim-markdown')
call dein#add('chase/vim-ansible-yaml')
call dein#add('ekalinin/Dockerfile.vim', {'on_ft': ['Dockerfile']})
call dein#add('elzr/vim-json', {'on_ft' : 'json'})
call dein#add('vim-scripts/po.vim--gray', {'on_ft': ['po']})  " Remove 'po' and leave the list empty if it fails
call dein#add('othree/html5.vim', {'on_ft': ['html', 'xhttml', 'css']})
call dein#add('mattn/emmet-vim', {'on_ft': ['html', 'xhttml', 'css', 'xml', 'xls', 'markdown']})
call dein#add('leafgarland/typescript-vim', {'on_ft': ['typescript']})

" Editor tools
" call dein#add('Shougo/neocomplete.vim')
call dein#add('scrooloose/syntastic')
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')
call dein#add('Yggdroot/indentLine')
call dein#add('sjl/gundo.vim', {'on_cmd': 'GundoToggle'})
call dein#add('joedicastro/DirDiff.vim', {'on_cmd' : 'DirDiff'})
call dein#add('Shougo/vinarise.vim')  " Hexadecimal editor
call dein#add('Rykka/easydigraph.vim')
call dein#add('kshenoy/vim-signature')  " Marks in side bar
call dein#add('tpope/vim-obsession')  " Continuously updated session files
call dein#add('bling/vim-airline')  " A better looking status line
call dein#add('vim-airline/vim-airline-themes')
call dein#add('vim-scripts/loremipsum', {'on_cmd' : 'Loremipsum'})
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-vinegar')  " enhances netrw
call dein#add('tpope/vim-characterize')  " character info => ga
call dein#add('delimitMate.vim')  " Autocompletion of (, [, {, ', \", ...
call dein#add('tpope/vim-speeddating')  " Smart and fast date changer <c-a> <c-x>
call dein#add('tpope/vim-repeat')  " extend repetitions by the 'dot' key
call dein#add('tpope/vim-dispatch')  " asynchronous build and test dispatcher
call dein#add('Konfekt/FastFold')  " Speed up Vim by updating folds only when called-for

" Tmux
call dein#add('benmills/vimux')

" Python
call dein#add('klen/python-mode', {'on_ft': ['python']})
call dein#add('jmcantrell/vim-virtualenv')
call dein#add('alfredodeza/coveragepy.vim', {'on_ft': ['python']})
call dein#add('fisadev/vim-isort', {'on_ft': ['python']})

" text-objects
call dein#add('kana/vim-textobj-entire') " ae, ie
call dein#add('kana/vim-textobj-indent') " ai, ii, aI, iI
call dein#add('kana/vim-textobj-lastpat') " a/, i/, a?, i?
call dein#add('kana/vim-textobj-line') " al, il
call dein#add('kana/vim-textobj-underscore') " a_, i_
call dein#add('kana/vim-textobj-user')
call dein#add('bps/vim-textobj-python')

call dein#end()

" First-time plugins installation
if iCanHazDein == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    set nomore
    call dein#install()
endif

" Check if all of the plugins are already installed, in other case it will
" install them (useful to add plugins in the .vimrc)
if  dein#check_install()
    call dein#install()
endif

filetype plugin indent on      " Indent and plugins by filetype
let mapleader = ','
let maplocalleader = ' '
scriptencoding utf-8
set encoding=utf-8              " setup the encoding to UTF-8
set ls=2                        " status line always visible
set go-=T                       " hide the toolbar
set go-=m                       " hide the menu
" The next two lines are quite tricky, but in Gvim, if you don't do this, if you
" only hide all the scrollbars, the vertical scrollbar is showed anyway
set go+=rRlLbh                  " show all the scrollbars
set go-=rRlLbh                  " hide all the scrollbars
set visualbell                  " turn on the visual bell
set cursorline                  " highlight the line under the cursor
set fillchars+=vert:│           " better looking for windows separator
set ttyfast                     " better screen redraw
set title                       " set the terminal title to the current file
set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed
set autoread                    " update a open file edited outside of Vim
set ttimeoutlen=0               " toggle between modes almost instantly
set backspace=indent,eol,start  " defines the backspace key behavior
set virtualedit=all             " to edit where there is no actual character
set more                        " to show pages using `more` in command outpouts

" Searching
set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters
" Turn off highlighting when dropping into insert mode, and turn back on again
" when leaving
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch
nnoremap <leader>/ :nohlsearch<cr>

" History and permanent undo levels
set undolevels=1000
set history=1000
set undofile
set undoreload=1000

" Backups
set backup
set noswapfile
set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/
set viminfo+=n$HOME/.vim/tmp/viminfo

" make this dirs if no exists previously
function! MakeDirIfNoExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction
silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)

" Wildmenu
set wildmenu                        " Command line autocompletion
set wildmode=list:longest,full      " Shows all the options
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.jar                            " java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats

" Tabs, space and wrapping
set expandtab                  " spaces instead of tabs
set tabstop=4                  " a tab = four spaces
set shiftwidth=4               " number of spaces for auto-indent
set softtabstop=4              " a soft-tab of four spaces
set autoindent nosmartindent   " set on the auto-indent
" set formatoptions=qrn1ct
set textwidth=80
set colorcolumn=81

" Autocompletion
set complete=.,w,b,u,t,i,kspell

" Colorscheme
" syntax enable                  " enable the syntax highlight
augroup color_all
    autocmd!
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
augroup END
set background=dark            " set a dark background
set t_Co=256                   " 256 colors for the terminal
if has('gui_running')
    colorscheme molokai
else
    colorscheme molokai256
    " colorscheme badwolf
    " colorscheme harlequin
    " colorscheme vividchalk
endif
set guifont=Dejavu\ Sans\ Mono\ for\ Powerline\ 11

" Resize the divisions if the Vim window size changes
au VimResized * exe "normal! \<c-w>="

" Utility functions with maps

function! ToggleWrap()
    let s:nowrap_cc_bg = [22, '#005f00']
    redir => s:curr_cc_hi
    silent hi ColorColumn
    redir END
    let s:curr_cc_ctermbg = matchstr(s:curr_cc_hi, 'ctermbg=\zs.\{-}\s\ze\1')
    let s:curr_cc_guibg = matchstr(s:curr_cc_hi, 'guibg=\zs.\{-}\_$\ze\1')
    if s:curr_cc_ctermbg != s:nowrap_cc_bg[0]
        let g:curr_cc_ctermbg = s:curr_cc_ctermbg
    endif
    if s:curr_cc_guibg != s:nowrap_cc_bg[1]
        let g:curr_cc_guibg = s:curr_cc_guibg
    endif
    if &textwidth == 80
        set textwidth=0
        exec 'hi ColorColumn ctermbg='.s:nowrap_cc_bg[0].
                    \' guibg='.s:nowrap_cc_bg[1]
    elseif &textwidth == 0
        set textwidth=80
        exec 'hi ColorColumn ctermbg='.g:curr_cc_ctermbg.
                    \' guibg='.g:curr_cc_guibg
    endif
endfunction

nmap <silent><Leader>ew :call ToggleWrap()<CR>

" Toggle line numbers
nnoremap <silent><Leader>l :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
  if !&number && !&relativenumber
      set number
      set norelativenumber
  elseif &number && !&relativenumber
      set nonumber
      set relativenumber
  elseif !&number && &relativenumber
      set number
      set relativenumber
  elseif &number && &relativenumber
      set nonumber
      set norelativenumber
  endif
endfunction

set number
set relativenumber

" Show hidden chars
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
nmap <Leader>h :set list!<CR>

" Folding
set foldmethod=marker
set foldlevel=99

" Spelling
autocmd FileType gitcommit setlocal spell! spelllang=en
autocmd FileType markdown setlocal spell! spelllang=en
autocmd FileType mkd setlocal spell! spelllang=en
autocmd FileType rst setlocal spell! spelllang=en

nmap <Leader>ss :setlocal spell! spelllang=es<CR>
nmap <Leader>se :setlocal spell! spelllang=en<CR>
" ]s and [s to move. z= to suggest. zg to add a word

" Move between Vim and Tmux windows
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      " The sleep and & gives time to get back to vim so tmux's focus tracking
      " can kick in and send us our ^[[O
      execute "silent !sh -c 'sleep 0.01; tmux select-pane -" . a:tmuxdir . "' &"
      redraw!
    endif
  endfunction
  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te
  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<CR>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<CR>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<CR>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<CR>
endif

" Execution permissions by default to shebang (#!) files
augroup shebang_chmod
  autocmd!
  autocmd BufNewFile  * let b:brand_new_file = 1
  autocmd BufWritePost * unlet! b:brand_new_file
  autocmd BufWritePre *
        \ if exists('b:brand_new_file') |
        \   if getline(1) =~ '^#!' |
        \     let b:chmod_post = '+x' |
        \   endif |
        \ endif
  autocmd BufWritePost,FileWritePost *
        \ if exists('b:chmod_post') && executable('chmod') |
        \   silent! execute '!chmod '.b:chmod_post.' "<afile>"' |
        \   unlet b:chmod_post |
        \ endif
augroup END

" Airline
set noshowmode
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#non_zero_only = 1

" Commentary
nmap <Leader>c <Plug>CommentaryLine
xmap <Leader>c <Plug>Commentary
augroup plugin_commentary
    au!
    au FileType python setlocal commentstring=#%s
    au FileType htmldjango setlocal commentstring={#\ %s\ #}
    au FileType puppet setlocal commentstring=#\ %s
    au FileType xquery setlocal commentstring=(:\ %s\ :)
augroup END

" delimitmate
let delimitMate_expand_space = 1

" easydigraph
let g:EasyDigraph_nmap = '<Leader>dd'

" Fugitive
nnoremap <Leader>gn :Unite output:echo\ system("git\ init")<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>go :Gread<CR>
nnoremap <Leader>gR :Gremove<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Gbrowse<CR>
nnoremap <Leader>gp :Git! push<CR>
nnoremap <Leader>gP :Git! pull<CR>
nnoremap <Leader>gi :Git!<Space>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gE :Gedit<Space>
nnoremap <Leader>gl :exe "silent Glog <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gL :exe "silent Glog -- <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gt :!tig<CR>:redraw!<CR>
nnoremap <Leader>gg :exe 'silent Ggrep -i '.input("Pattern: ")<Bar>Unite
            \ quickfix -no-quit<CR>
nnoremap <Leader>ggm :exe 'silent Glog --grep='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>
nnoremap <Leader>ggt :exe 'silent Glog -S='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>

nnoremap <Leader>ggc :silent! Ggrep -i<Space>
nnoremap <leader>ga :silent! Git add %<cr>:redraw!<cr>

if !exists(":Gdiffoff")
    command Gdiffoff diffoff | q | Gedit
endif
noremap <Leader>dq :Gdiffoff<CR>

" Gitv
nnoremap <silent> <leader>gv :Gitv --all<CR>
nnoremap <silent> <leader>gV :Gitv! --all<CR>
vnoremap <silent> <leader>gV :Gitv! --all<CR>
let g:Gitv_OpenHorizontal = 'auto'
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_DoNotMapCtrlKey = 1
" let g:Gitv_WrapLines = 1
autocmd FileType git set nofoldenable

" Gundo
nnoremap <Leader>u :GundoToggle<CR>
let g:gundo_preview_bottom = 1

" indentLine
map <silent> <Leader>L :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
let g:indentLine_char = '┊'
let g:indentLine_color_term = 239

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_refresh_always = 1
let g:neocomplete#max_list = 30
let g:neocomplete#min_keyword_length = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#data_directory = $HOME.'/.vim/tmp/neocomplete'

" disable the auto select feature by default to speed up writing without
" obstacles (is optimal for certain situations)
let g:neocomplete#enable_auto_select = 0

" toggle the auto select feature
function! ToggleNeoComplete()
  if !g:neocomplete#disable_auto_complete && g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 0
      let g:neocomplete#enable_auto_select = 0
  elseif !g:neocomplete#disable_auto_complete && !g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 1
      let g:neocomplete#enable_auto_select = 0
  elseif g:neocomplete#disable_auto_complete && !g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 0
      let g:neocomplete#enable_auto_select = 1
  endif
endfunction
nnoremap <silent><Leader>ea :call ToggleNeoComplete()<CR>

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType html,markdown setlocal list
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.python='[^. \t]\.\w*'
" let g:neocomplete#fallback_mappings = ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]

" Dein
let g:dein#enable_notification=1
let g:dein#notification_time=5

" Po.vim
let g:po_translator = "Jose Garcia (JoseKilo)<jose.eduardo.gd@gmail.com>"

" PythonMode
let g:pymode_breakpoint_bind = '<Leader>B'
let g:pymode_lint = 0  " Use Syntastic instead (this doesn't work with flake8)
let g:pymode_virtualenv = 1
let g:pymode_rope = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_lookup_project = 0
" let g:pymode_rope_project_root = "."
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_autoimport = 0  " Seriously, DON'T ... Or maybe yes ... NO !!
let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime', 'itertools', 'logging']
let g:pymode_rope_autoimport_import_after_complete = 1
let g:pymode_doc = 0

" Syntastic
nmap <silent><Leader>N :SyntasticCheck<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_check_on_open = 1
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['python', 'css', 'json', 'javascript'],
            \ 'passive_filetypes': ['po', 'typescript'] }
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol  = '⚡'
let g:syntastic_style_warning_symbol  = '⚡'

" check json files with jshint
let g:syntastic_filetype_map = { "json": "javascript", }
let g:syntastic_javascript_checkers = []
if filereadable(".jscsrc")
    call add(g:syntastic_javascript_checkers, "jscs")
endif
if filereadable(".jshintrc")
    call add(g:syntastic_javascript_checkers, "jshint")
endif

" Unite
nnoremap <silent><Leader>o :Unite -silent -start-insert file_rec/async:!<CR>
nnoremap <silent><Leader>O :Unite -silent -start-insert file_rec/git<CR>
nnoremap <silent><Leader>b :Unite -silent buffer<CR>
nnoremap <silent><Leader>p :Unite -silent tab<CR>
nnoremap <silent> g<C-h> :UniteWithCursorWord -silent help<CR>
nnoremap <silent> <leader>? :Unite -toggle -auto-resize -auto-highlight -input=TODO grep:.<CR>
nnoremap <silent><Leader>i :Unite -silent outline<CR>

nnoremap <silent><Leader>s :Unite -silent -start-insert grep:.<CR>
nnoremap <silent><Leader>a :UniteWithCursorWord -silent -start-insert grep:.<CR>

nnoremap <silent><Leader>sss :UniteWithCursorWord -silent file_rec/async:! grep:.<CR>

if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -S -i --line-numbers --ignore-dir node_modules --ignore-dir migrations --ignore-dir static --ignore-dir media --ignore-dir fixtures --ignore-dir mekami-web'
    if !empty($VIRTUAL_ENV)
      let g:unite_source_grep_default_opts .= ' --ignore-dir $VIRTUAL_ENV'
    endif
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_search_word_highlight = 1
endif

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
let unite_ignore_pattern = ['\.git/', 'tmp/', 'bundle/']
if !empty($VIRTUAL_ENV)
  let unite_ignore_pattern += [$VIRTUAL_ENV]
endif
call unite#custom#source('file,file_rec,file_rec/async,file_rec/git,grep',
            \ 'ignore_pattern', join(unite_ignore_pattern, '\|'))
call unite#custom#source('file,file_rec,file_rec/async,file_rec/git,grep',
            \ 'ignore_globs', ['./.*', './.*/'])

let g:default_context = {
    \ 'winheight' : 15,
    \ 'update_time' : 200,
    \ 'prompt' : '>>> ',
    \ 'enable_start_insert' : 0,
    \ 'enable_short_source_names' : 0,
    \ 'marked_icon' : '✓',
    \ 'ignorecase' : 1,
    \ 'smartcase' : 1,
\ }

call unite#custom#profile('default', 'context', default_context)

let g:unite_source_history_yank_enable = 1
let g:unite_force_overwrite_statusline = 0
let g:unite_split_rule = 'botright'
let g:unite_data_directory = $HOME.'/.vim/tmp/unite'
let g:unite_source_buffer_time_format = '(%d-%m-%Y %H:%M:%S) '

" vimux
let g:VimuxUseNearestPane = 1
map <Leader>rc :VimuxPromptCommand<CR>
map <Leader>rl :VimuxRunLastCommand<CR>
map <Leader>rs :VimuxInterruptRunner<CR>
map <Leader>ri :VimuxInspectRunner<CR>
map <Leader>rq :VimuxCloseRunner<CR>

" Vinarise
map <F6> :Vinarise<CR>
let g:vinarise_enable_auto_detect = 1
au FileType vinarise let g:airline_section_warning = ''

" Virtualenv
let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '(%n)'

" FILETYPES
augroup json_autocmd
    autocmd!
    autocmd FileType json set foldmethod=syntax
augroup END
augroup markdown_autocmd
    autocmd!
    autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
augroup END
au BufRead,BufNewFile */templates/*.html setlocal filetype=htmldjango.html
au BufRead,BufNewFile rc.lua setlocal foldmethod=marker
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
au FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2

nnoremap <Leader>m :%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>
vnoremap <Leader>m :<BS><BS><BS><BS><BS>%s/\%V//g<Left><Left>
nnoremap <Leader>f :%s///g<Left><Left>
nnoremap <Leader>w :w<CR>
nnoremap <space> za
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lell
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lell
nnoremap <leader>` viw<esc>a`<esc>hbi`<esc>lell
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>l
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>l
vnoremap <leader>` <esc>`<i`<esc>`>la`<esc>l

" inoremap <esc> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

let g:AutoCloseExpandSpace = 0 " Make iabbrev work again

inoreabbrev @@@ jose.eduardo.gd@gmail.com
inoreabbrev ccop Copyright, all rights reserved.
inoreabbrev ssig --<cr>Jose Garcia (Jose Kilo)<cr>jose.eduardo.gd@gmail.com
inoreabbrev ttest def test_(self):<cr>self.assertEqual('', '')

augroup filetype_html
    autocmd!
    autocmd BufRead,BufNewFile *.html setlocal nowrap
    autocmd FileType html,htmldjango.html  :inoreabbrev <buffer> --- &mdash;
    autocmd FileType html,htmldjango.html set tabstop=2
    autocmd FileType html,htmldjango.html set shiftwidth=2
    autocmd FileType html,htmldjango.html set softtabstop=2
augroup END
augroup filetype_typescript
    autocmd!
    autocmd FileType typescript set tabstop=2
    autocmd FileType typescript set shiftwidth=2
    autocmd FileType typescript set softtabstop=2
    autocmd FileType typescript let g:netrw_list_hide= '.*\.js,.*\.map$'
augroup END
augroup filetype_js
    autocmd!
    autocmd BufRead,BufNewFile *.js setlocal nowrap
    autocmd BufRead,BufNewFile *.js setlocal smarttab
    autocmd BufRead,BufNewFile *.js setlocal expandtab
    autocmd BufRead,BufNewFile *.js setlocal tabstop=4
    autocmd BufRead,BufNewFile *.js setlocal shiftwidth=4
    autocmd BufRead,BufNewFile *.js setlocal softtabstop=4
    autocmd BufRead,BufNewFile *.js setlocal autoindent
    autocmd BufRead,BufNewFile *.js setlocal foldmethod=syntax
    autocmd BufRead,BufNewFile *.js let javaScript_fold=1
    autocmd BufRead,BufNewFile *.js setlocal syntax=javascript
    autocmd BufRead,BufNewFile *.js setlocal textwidth=120
    autocmd BufRead,BufNewFile *.js setlocal colorcolumn=121
    autocmd BufRead,BufNewFile *.js syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
augroup END
augroup filetype_python
    autocmd!
    autocmd FileType python :inoreabbrev <buffer> iif if:<left>
    autocmd FileType python :inoreabbrev <buffer> wwh while:<left>
    autocmd FileType python :inoreabbrev <buffer> ffo for i in:<left>
    autocmd FileType python :inoreabbrev <buffer> rrr return
    set colorcolumn=81
augroup END
augroup filetype_txt
    autocmd!
    set textwidth=80
    set colorcolumn=81
augroup END
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown,rst :onoremap <buffer> ih :<c-u>execute "normal! ?^\\(==\\+\\)\\\\|\\(--\\+\\)$\r:nohlsearch\rkvg_"<cr>
    autocmd FileType markdown,rst :onoremap <buffer> ah :<c-u>execute "normal! ?^\\(==\\+\\)\\\\|\\(--\\+\\)$\r:nohlsearch\rg_vk0"<cr>
augroup END
augroup filetype_all
    autocmd!
    autocmd InsertLeave * match ExtraWhitespace /\v\s+$/
augroup END

onoremap p i(
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap an{ :<c-u>normal! f{va{<cr>
onoremap al{ :<c-u>normal! F}va{<cr>
onoremap in@ :<c-u>execute "normal! /\\S\\+@\\S\\+\r:nohlsearch\rvt@"<cr>
onoremap an@ :<c-u>execute "normal! /\\S\\+@\\S\\+\r:nohlsearch\rvt "<cr>
onoremap ip@ :<c-u>execute "normal! ?\\S\\+@\\S\\+\r:nohlsearch\rvt@"<cr>
onoremap ap@ :<c-u>execute "normal! ?\\S\\+@\\S\\+\r:nohlsearch\rvt "<cr>

nnoremap <leader>rr pkddyy
nnoremap <leader>; :execute "normal! m`A;\e``"<cr>
nnoremap <leader>tt :execute "!python manage.py test --noinput -s -x --settings=$DJANGO_SETTINGS % 2> .error.txt"<cr>:call <SID>loadTestErrors()<cr>
nnoremap <leader>ttt :execute "!python manage.py test --noinput -s -x --settings=$DJANGO_SETTINGS 2> .error.txt"<cr>:call <SID>loadTestErrors()<cr>

nnoremap <leader>t :call <SID>testCurrentTest()<cr>

function! s:loadTestErrors()
    redraw!
    cfile .error.txt
    copen
endfunction

function! s:testCurrentTest()
    let saved_unnamed_register = @@
    execute "normal! ?^class\ \rwyiw\<c-o>"
    let class_name = @@
    execute "normal! ?def test_\rwyiw\<c-o>"
    let test_name = @@
    execute "!python manage.py test --noinput -s -x --settings=$DJANGO_SETTINGS %:" . class_name . "." . test_name " 2> .error.txt"
    redraw!
    loadTestErrors()
    let @@ = saved_unnamed_register
endfunction

vnoremap // y/<C-R>"<CR>"

if filereadable(".vimrc") && $PWD != $HOME
    source .vimrc
endif

let g:netrw_liststyle=3
let g:netrw_list_hide= '.*\.pyc$'
nnoremap <Leader>j :vsplit<CR>:Explore<CR>
noremap <Leader>y :<C-U>silent'<,'>w !xclip -sel clip<CR>
noremap <Leader>r :checkt<CR>
set completeopt=menu,longest,preview

set path=**                     " Search the files under the run location.
set suffixesadd=.py             " Look for Python files.
set shell=bash

set nrformats-=octal            " Turn off octal increment / decrement so that
                                " numbers with leading zeros won't go from 007
                                " to 010

nnoremap <C-j> :tabe 

" Ansible support via 'chase/vim-ansible-yaml'
let g:ansible_options = {'ignore_blank_lines': 0}

noremap <Leader>wc :echo system('wc -w ' . shellescape(expand('%')))<CR>

" Allow to repeat in visual mode
vnoremap . :norm.<CR>

" Fast window & buffer close and kill
nnoremap <Leader>k <C-w>c
nnoremap <silent><Leader>K :bd<CR>

" Cut/Paste
" to/from the clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p

" toggle paste mode
map <Leader>P :set invpaste<CR>

" Save as root
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" Quick saving
nmap <silent> <Leader>w :update<CR>

" Delete trailing whitespaces
nmap <silent><Leader>et :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" for the diffmode
noremap <Leader>du :diffupdate<CR>

" let g:unite_source_rec_max_cache_files = 0
" call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 0)

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
