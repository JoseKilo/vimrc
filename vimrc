" Author: Jose Garcia (JoseKilo) jose.eduardo.gd@gmail.com
" Source: https://github.com/JoseKilo/vimrc

" To meditate mindfully demands 'an open and receptive, nonjudgmental
" awareness of your present-moment experience'.

" Quien lleva 4 pesetas / Y un chorizo en la maleta
" Y apuntá en una libreta / La estación de duseldó

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

" It is better if Dein rules Dein (needed!)
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc', {'build': 'make'})

" Denite
call dein#add('Shougo/denite.nvim')

" Color schemes
call dein#add('joedicastro/vim-molokai256')
call dein#add('jonathanfilip/vim-lucius')
call dein#add('sjl/badwolf')
call dein#add('bling/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

" Git
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')  " Changes in side bar
call dein#add('gregsexton/gitv', {'depends': ['tpope/vim-fugitive']})

" Custom Syntax
call dein#add('plasticboy/vim-markdown')
call dein#add('chase/vim-ansible-yaml')
call dein#add('ekalinin/Dockerfile.vim', {'on_ft': ['Dockerfile']})
call dein#add('vim-scripts/po.vim--gray', {'on_ft': ['po']})  " Remove 'po' and leave the list empty if it fails
call dein#add('othree/html5.vim', {'on_ft': ['html', 'xhttml', 'css']})
call dein#add('mattn/emmet-vim', {'on_ft': ['html', 'xhttml', 'css', 'xml', 'xls', 'markdown']})
call dein#add('leafgarland/typescript-vim', {'on_ft': ['typescript']})
call dein#add('artur-shaik/vim-javacomplete2', {'on_ft': ['java']})
call dein#add('JavaScript-syntax', {'on_ft': ['javascript']})

" Editor tools
call dein#add('neomake/neomake')
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')
call dein#add('Yggdroot/indentLine')
call dein#add('sjl/gundo.vim', {'on_cmd': 'GundoToggle'})
call dein#add('joedicastro/DirDiff.vim', {'on_cmd' : 'DirDiff'})
call dein#add('Shougo/vinarise.vim')  " Hexadecimal editor
call dein#add('Rykka/easydigraph.vim')
call dein#add('kshenoy/vim-signature')  " Marks in side bar
call dein#add('tpope/vim-obsession')  " Continuously updated session files
call dein#add('vim-scripts/loremipsum')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-surround')
call dein#add('manasthakur/vim-vinegar')  " enhances netrw
call dein#add('tpope/vim-characterize')  " character info => ga
call dein#add('delimitMate.vim')  " Autocompletion of (, [, {, ', \", ...
call dein#add('tpope/vim-speeddating')  " Smart and fast date changer <c-a> <c-x>
call dein#add('tpope/vim-repeat')  " extend repetitions by the 'dot' key
call dein#add('tpope/vim-dispatch')  " asynchronous build and test dispatcher
call dein#add('AndrewRadev/splitjoin.vim')  " gS gJ
call dein#add('tommcdo/vim-exchange')  " cxiw
call dein#add('tpope/vim-unimpaired')  " ]b ]l ]q ...

" Python
call dein#add('python-mode/python-mode', {'on_ft': ['python']})
call dein#add('alfredodeza/coveragepy.vim', {'on_ft': ['python']})

" text-objects
call dein#add('kana/vim-textobj-entire') " ae, ie
call dein#add('kana/vim-textobj-indent') " ai, ii, aI, iI
call dein#add('kana/vim-textobj-lastpat') " a/, i/, a?, i?
call dein#add('kana/vim-textobj-line') " al, il
call dein#add('kana/vim-textobj-underscore') " a_, i_
call dein#add('kana/vim-textobj-user')
call dein#add('bps/vim-textobj-python')
call dein#add('PeterRincker/vim-argumentative')

call dein#end()

" First-time plugins installation
if iCanHazDein == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    set nomore
    call dein#install()
endif

" Check if all of the plugins are already installed
if  dein#check_install()
    call dein#install()
endif

filetype plugin indent on      " Indent and plugins by filetype
let mapleader = ','
let maplocalleader = ' '
set encoding=utf-8              " setup the encoding to UTF-8
set ls=2                        " status line always visible
set novisualbell                " turn off the visual bell
set cursorline                  " highlight the line under the cursor
set fillchars+=vert:│           " better looking for windows separator
set ttyfast                     " better screen redraw
set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed
set autoread                    " update a open file edited outside of Vim
set ttimeoutlen=0               " toggle between modes almost instantly
set backspace=indent,eol,start  " defines the backspace key behavior
set virtualedit=all             " to edit where there is no actual character
set more                        " to show pages using `more` in command outpouts
set showmatch                   " show pairs match
set nrformats-=octal            " Turn off octal increment / decrement so that
                                " numbers with leading zeros won't go from 007
                                " to 010
set shell=bash
set scrolloff=3
set nomodeline
set foldlevel=99

" Searching
set incsearch hlsearch smartcase ignorecase
" Turn off highlighting in insert mode, and turn back on again when leaving
augroup highlight_search
    autocmd!
    autocmd InsertEnter * :setlocal nohlsearch
    autocmd InsertLeave * :setlocal hlsearch
augroup END
nnoremap <leader>/ :nohlsearch<cr>

" History and permanent undo levels
set undolevels=1000 history=1000 undofile undoreload=1000

" Backups
set backup noswapfile
set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/
set viminfo+=n$HOME/.vim/tmp/viminfo

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
set wildignore+=*.luac,*.jar,*.pyc,*.stats       " Temporal files

" Tabs, space and wrapping
set expandtab                  " spaces instead of tabs
set tabstop=4                  " a tab = four spaces
set shiftwidth=4               " number of spaces for auto-indent
set softtabstop=4              " a soft-tab of four spaces
set autoindent nosmartindent   " set on the auto-indent
set formatoptions=cqnl1j       " before qrn1ct - default tcq
set textwidth=79
set colorcolumn=81

" Autocompletion
set complete=.,w,b,u,k,kspell
set completeopt=menu,longest
set dictionary=$HOME/.vim/dictionaries/keywords.txt

set path=**                     " Search the files under the run location.
set suffixesadd=.py             " Look for Python files.

" Colorscheme
syntax enable
augroup color_all
    autocmd!
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkred
    autocmd InsertLeave * match ExtraWhitespace /\v\s+$/
    autocmd ColorScheme * highlight NeomakeErrorSign ctermfg=white ctermbg=darkred
    autocmd ColorScheme * highlight NeomakeError ctermfg=white ctermbg=darkred
    autocmd ColorScheme * highlight NeomakeWarningSign ctermfg=yellow
    autocmd ColorScheme * highlight DeniteChar ctermbg=24
augroup END
set background=dark
set t_Co=256                   " 256 colors for the terminal
colorscheme lucius             " molokai256 badwolf lucius

" Airline
set noshowmode
let g:airline_theme='lucius'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#non_zero_only = 1

" Resize the divisions if the Vim window size changes
augroup vim_resize
    autocmd!
    autocmd VimResized * exe "normal! \<c-w>="
augroup END

" Show hidden chars
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
nmap <Leader>h :set list!<CR>

" Spelling
augroup spelling
    autocmd!
    autocmd FileType gitcommit,markdown,mkd,rst,text setlocal spell! spelllang=en
augroup END

nmap <Leader>ss :setlocal spell! spelllang=es<CR>
nmap <Leader>se :setlocal spell! spelllang=en<CR>
" ]s and [s to move. z= to suggest. zg to add a word

" Commentary
augroup plugin_commentary
    autocmd!
    autocmd FileType python setlocal commentstring=#%s
    autocmd FileType htmldjango setlocal commentstring={#\ %s\ #}
    autocmd FileType puppet setlocal commentstring=#\ %s
    autocmd FileType xquery setlocal commentstring=(:\ %s\ :)
augroup END

" delimitmate
let delimitMate_expand_space = 1

" easydigraph
let g:EasyDigraph_nmap = '<Leader>dd'

" Fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>go :Gread<CR>
nnoremap <Leader>gR :Gremove<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gc :Gcommit<CR>:setlocal spell! spelllang=en<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gE :Gedit<Space>
nnoremap <Leader>gt :!tig<CR>:redraw!<CR>
nnoremap <leader>ga :silent! Git add %<cr>:redraw!<cr>
nnoremap <leader>gn :silent! Git commit --amend --no-edit -a<cr>:e %<cr>:redraw!<cr>
nnoremap <Leader>gl :exe "silent Glog <Bar> copen"<CR>:redraw!<CR>
nnoremap <Leader>gL :exe "silent Glog -- <Bar> copen"<CR>:redraw!<CR>

nnoremap <Leader>ggc :silent! Ggrep -i<Space>
nnoremap <Leader>gg :exe 'silent Ggrep -i '.input("Pattern: ")<Bar>copen<CR>

" Gitv
nnoremap <silent> <leader>gv :Gitv --all<CR>
nnoremap <silent> <leader>gV :Gitv! --all<CR>
vnoremap <silent> <leader>gV :Gitv! --all<CR>
let g:Gitv_OpenHorizontal = 'auto'
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_DoNotMapCtrlKey = 1
" let g:Gitv_WrapLines = 1
augroup git_fold
    autocmd!
    autocmd FileType git set nofoldenable
augroup END

" Gundo
nnoremap <Leader>u :GundoToggle<CR>
let g:gundo_preview_bottom = 1

" indentLine
map <silent> <Leader>L :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
let g:indentLine_char = '┊'
let g:indentLine_color_term = 239

" PythonMode
let g:pymode_breakpoint_bind = '<Leader>B'
let g:pymode_rope = 1
let g:pymode_virtualenv = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_rope_completion = 1
let g:pymode_doc = 0
let g:pymode_run = 0
let g:pymode_lint = 0
let g:pymode_options = 0
let g:pymode_folding = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_autoimport = 0

" Neomake
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_javascript_enabled_makers = []
if filereadable(".jscsrc")
    call add(g:neomake_javascript_enabled_makers, "jscs")
endif
if filereadable(".jshintrc")
    call add(g:neomake_javascript_enabled_makers, "jshint")
endif

augroup NeomakeOnWrite
    autocmd!
    autocmd BufWritePost * Neomake
augroup END
nnoremap <silent>gM :Neomake!<cr>

let g:neomake_error_sign = {'text': '✗'}
let g:neomake_warning_sign = {'text': '⚠', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

" Denite
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command', ['git', 'ls-files'])
call denite#custom#option('default', 'prompt', '>>>')
call denite#custom#option('default', 'mode', 'normal')
call denite#custom#option('default', 'winheight', '15')
call denite#custom#option('default', 'cursor_wrap', 1)
call denite#custom#option('default', 'highlight_matched_char', 'DeniteChar')
call denite#custom#option('default', 'highlight_matched_range', 'nonexistent')
call denite#custom#option('default', 'highlight_mode_insert', 'CursorLine')
call denite#custom#option('default', 'highlight_mode_normal', 'Visual')
call denite#custom#option('default', 'statusline', 0)

nnoremap <silent><Leader>o :Denite -mode=insert file_rec/async:!<CR>
nnoremap <silent><Leader>O :Denite -mode=insert file_rec/git<CR>
nnoremap <silent><Leader>T :Denite -mode=insert -path=tests/ file_rec/git<CR>
" nnoremap <silent><Leader>b :Denite buffer<CR>
nnoremap <silent><leader>? :Denite -input=TODO grep:.<CR>
nnoremap <silent><Leader>i :Denite outline<CR>
nnoremap <silent><Leader>sa :Denite grep:.<CR>
nnoremap <silent><Leader>a :DeniteCursorWord grep:.<CR>
nnoremap <silent><Leader>sss :DeniteCursorWord file_rec/async:! grep:.<CR>

if executable('ag')
    let g:ag_options = '--nocolor --nogroup -S -i --line-numbers ' .
        \ '--ignore-dir node_modules --ignore-dir migrations ' .
        \ '--ignore-dir static --ignore-dir media'
    if !empty($VIRTUAL_ENV)
      let g:ag_options .= ' --ignore-dir $VIRTUAL_ENV'
    endif

    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts', split(g:ag_options, ' '))
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
endif

" Vinarise
map <F6> :Vinarise<CR>
let g:vinarise_enable_auto_detect = 1

" vim-ansible-yaml
let g:ansible_options = {'ignore_blank_lines': 0}

" javacomplete2
nmap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
let g:JavaComplete_ImportOrder = ['com.google.', '*', 'java.', 'javax.']
let g:JavaComplete_ImportSortType = 'packageName'
augroup plugin_java
    autocmd!
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup END

augroup filetype_autocmd
    autocmd!
    autocmd FileType vim :setlocal foldmethod=marker
    autocmd FileType json :setlocal foldmethod=syntax
    autocmd FileType json :setlocal formatprg=python\ -m\ json.tool
    autocmd FileType json :setlocal equalprg=python\ -m\ json.tool
    autocmd FileType ruby :setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType html,htmldjango.html inoreabbrev <buffer> --- &mdash;
    autocmd FileType html,htmldjango.html setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType typescript let g:netrw_list_hide= '.*\.js,.*\.map$'
    autocmd FileType java inoreabbrev <buffer> True true
    autocmd FileType java inoreabbrev <buffer> False false
    autocmd FileType java inoreabbrev <buffer> raise throw
    autocmd FileType java setlocal foldmethod=syntax
    autocmd FileType java setlocal tabstop=2 shiftwidth=2 softtabstop=2 cinoptions+=+2s
    autocmd FileType python setlocal textwidth=79 colorcolumn=81 define=^\s*\\(def\\\\|class\\)
    autocmd FileType python let g:netrw_list_hide= '.*\.pyc$'
    autocmd FileType python setlocal foldmethod=indent foldnestmax=2 makeprg=tox\ -e\ py27\ --\ %
    autocmd FileType python setlocal efm=%ETraceback%.%#,%C\ \ File\ \"%f\"\\,\ line\ %l\\,\ in\ test%.%#,%Z%[%^\ ]%\\@=%m,%C%.%#
    autocmd FileType text setlocal textwidth=79 colorcolumn=81 formatoptions=qrn1ct
    autocmd FileType markdown,rst :onoremap <buffer> ih :<c-u>execute "normal! ?^\\(==\\+\\)\\\\|\\(--\\+\\)$\r:nohlsearch\rkvg_"<cr>
    autocmd FileType markdown,rst :onoremap <buffer> ah :<c-u>execute "normal! ?^\\(==\\+\\)\\\\|\\(--\\+\\)$\r:nohlsearch\rg_vk0"<cr>
    autocmd FileType netrw setl bufhidden=wipe
    autocmd FileType html setlocal nowrap
    autocmd BufRead,BufNewFile */templates/*.html setlocal filetype=htmldjango.html
augroup END

inoreabbrev @@@ jose.eduardo.gd@gmail.com
inoreabbrev ccop Copyright, all rights reserved.
inoreabbrev ssig --<cr>Jose Garcia (Jose Kilo)<cr>jose.eduardo.gd@gmail.com

" inoremap <esc> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Search visual selection
vnoremap // y/<C-R>"<BS><CR>

let g:netrw_liststyle=3

noremap <Leader>r :checkt<CR>
nnoremap <c-j> :tabe<space>
nnoremap <c-t>t :tabn<cr>

" Allow to repeat in visual mode
vnoremap . :norm.<CR>

" Fast window & buffer close and kill
nnoremap <Leader>k :bwipeout<CR>
nnoremap <silent><Leader>K :bd<CR>

" Toggle paste mode
nnoremap <Leader>P :set invpaste<CR>

" Save as root
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" Delete trailing whitespaces
noremap <silent><Leader>et :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" For the diffmode
noremap <Leader>du :diffupdate<CR>

" Join paragraphs in one-liners
nnoremap <silent> gL :g/./,/^$/join<cr>

map Y y$
nnoremap <Leader>m :%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>
vnoremap <Leader>m :<BS><BS><BS><BS><BS>%s/\%V//g<Left><Left>
nnoremap <Leader>f :%s///g<Left><Left>
nnoremap <space> :bnext<cr>
nnoremap \ zak<cr>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>ek :e $HOME/.vim/dictionaries/keywords.txt<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> gs :!isort %<cr>:redraw!<cr>
nnoremap <silent> g/ :%s///gn<cr>
nnoremap <silent>g% :Make<cr>:Coveragepy show<cr>
nnoremap <leader>; :execute "normal! m`A;\e``"<cr>

" Select last changed (or pasted) text
nnoremap gp `[v`]
nnoremap <leader>= `[v`]=

if filereadable(".vimrc") && $PWD != $HOME
    source .vimrc
endif

" Scroll to previous indentation level
nnoremap <leader>v :<c-u>execute "normal! ?^" .
            \ repeat('\ ', ((len(matchstr(getline('.'), '\(^\s*\)')) / &tabstop) - 1) * &tabstop) .
            \ "\\%<" . line('.') . "l\\S\r:nohlsearch\rzz"<cr>

" Utility functions with maps

" Toggle line numbers
set number
set relativenumber
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

" Create parent dirs if they don't exist on writing a new a file
function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

function! BackgroundCommandClose(channel)
  unlet g:backgroundCommandOutput
endfunction

function! RunBackgroundCommand(command)
  if v:version < 800
    echoerr 'RunBackgroundCommand requires VIM version 8 or higher'
    return
  endif

  if exists('g:backgroundCommandOutput')
    echo 'Already running task in background'
  else
    echo 'Running task in background'
    let g:backgroundCommandOutput = tempname()
    let g:backgroundCommandJob = job_start(a:command, {
                \ 'close_cb': 'BackgroundCommandClose',
                \ 'out_io': 'file',
                \ 'out_name': g:backgroundCommandOutput
                \ })
  endif
endfunction

let g:noiseCommand = 'play --no-show-progress -c 2 --null synth 01:00 ' .
            \ 'brownnoise band -n 100 499 tremolo 0.1 43 reverb 19 bass ' .
            \ '-11 treble -1 vol 14dB repeat 59'
nnoremap <silent> <leader>ppp :call RunBackgroundCommand(g:noiseCommand)<CR>
nnoremap <silent> <leader>ooo :call job_stop(g:backgroundCommandJob)<CR>

" Go to last change when opening a file
augroup last_change
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
augroup END

xmap aC <Plug>(textobj-python-class-a)
omap aC <Plug>(textobj-python-class-a)
xmap iC <Plug>(textobj-python-class-i)
omap iC <Plug>(textobj-python-class-i)
xmap aM <Plug>(textobj-python-method-a)
omap aM <Plug>(textobj-python-method-a)
xmap iM <Plug>(textobj-python-method-i)
omap iM <Plug>(textobj-python-method-i)
