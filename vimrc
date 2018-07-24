" Author: Jose Garcia (JoseKilo) jose.eduardo.gd@gmail.com
" Source: https://github.com/JoseKilo/vimrc

" To meditate mindfully demands 'an open and receptive, nonjudgmental
" awareness of your present-moment experience'.

" Quien lleva 4 pesetas / Y un chorizo en la maleta
" Y apuntá en una libreta / La estación de duseldó

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

" Denite
call dein#add('Shougo/denite.nvim')

" Color schemes
call dein#add('joedicastro/vim-molokai256')
call dein#add('jonathanfilip/vim-lucius')
call dein#add('sjl/badwolf')
call dein#add('dracula/vim')
call dein#add('whatyouhide/vim-gotham')
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
call dein#add('othree/html5.vim', {'on_ft': ['html', 'xhttml', 'css']})
call dein#add('leafgarland/typescript-vim', {'on_ft': ['typescript']})
call dein#add('artur-shaik/vim-javacomplete2', {'on_ft': ['java']})

" Editor tools
call dein#add('neomake/neomake')
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')
call dein#add('sjl/gundo.vim', {'on_cmd': 'GundoToggle'})
call dein#add('Shougo/vinarise.vim')  " Hexadecimal editor
call dein#add('kshenoy/vim-signature')  " Marks in side bar
call dein#add('vim-scripts/loremipsum')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-surround')
call dein#add('manasthakur/vim-vinegar')  " enhances netrw
call dein#add('tpope/vim-characterize')  " character info => ga
call dein#add('Raimondi/delimitMate')  " Autocompletion of (, [, {, ', \", ...
call dein#add('tpope/vim-repeat')  " extend repetitions by the 'dot' key
call dein#add('tpope/vim-dispatch')  " asynchronous build and test dispatcher
call dein#add('AndrewRadev/splitjoin.vim')  " zS zJ
call dein#add('tommcdo/vim-exchange')  " cxiw
call dein#add('tpope/vim-unimpaired')  " ]b ]l ]q ...
call dein#add('gorkunov/smartpairs.vim')  " vv vi{ va'
call dein#add('AndrewRadev/linediff.vim')  " :Linediff :LinediffReset
call dein#add('mhinz/vim-grepper')  " :Grepper
call dein#add('tpope/tpope-vim-abolish')  " :%Subvert/facilit{y,ies}/building{,s}/g
call dein#add('AndrewRadev/switch.vim')

" Python
call dein#add('python-mode/python-mode', {'on_ft': ['python']})
call dein#add('tmhedberg/SimpylFold', {'on_ft': ['python']})
call dein#add('google/yapf', {'rtp': 'plugins/vim', 'on_ft': ['python']})
call dein#add('mgedmin/coverage-highlight.vim', {'on_ft': ['python']})

" text-objects
call dein#add('kana/vim-textobj-entire') " ae, ie
call dein#add('kana/vim-textobj-indent') " ai, ii, aI, iI
call dein#add('kana/vim-textobj-lastpat') " a/, i/, a?, i?
call dein#add('kana/vim-textobj-line') " al, il
call dein#add('kana/vim-textobj-underscore') " a_, i_
call dein#add('kana/vim-textobj-user')
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
if dein#check_install()
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
set more                        " to show pages using `more` in command outputs
set showmatch                   " show pairs match
set nrformats-=octal            " Turn off octal increment / decrement so that
                                " numbers with leading zeros won't go from 007
                                " to 010
set shell=bash
set scrolloff=3
set nomodeline
set foldlevel=99
set updatetime=100

runtime macros/matchit.vim

" Searching
set incsearch hlsearch smartcase ignorecase
" Turn off highlighting in insert mode, and turn back on again when leaving
augroup highlight_search
    autocmd!
    autocmd InsertEnter * :setlocal nohlsearch
    autocmd InsertLeave * :setlocal hlsearch
augroup END
nnoremap <leader>/ :nohlsearch\|ccl\|lcl<cr>

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
set wildignore+=*.sw?                                 " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~           " Backup files
set wildignore+=*.class,*.luac,*.jar,*.pyc,*.stats    " Temporal files

" Tabs, space and wrapping
set expandtab                  " spaces instead of tabs
set tabstop=4                  " a tab = four spaces
set shiftwidth=4               " number of spaces for auto-indent
set softtabstop=4              " a soft-tab of four spaces
set autoindent nosmartindent   " set on the auto-indent
set shiftround                 " >> indents to next multiple of 'shiftwidth'
set formatoptions=cqnl1j       " before qrn1ct - default tcq
set textwidth=79
set colorcolumn=80
set linebreak                  " Don't break words when wrapping text

" Autocompletion
set complete=.,w,b,u,k,t,kspell
set completeopt=menu,longest
set dictionary=$HOME/.vim/dictionaries/keywords.txt

set path=**;.git                " Search the files under the run location.
set suffixesadd=.py             " Look for Python files.

" Colorscheme
syntax enable
augroup color_all
    autocmd!
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkred guibg=darkred
    autocmd InsertLeave * match ExtraWhitespace /\v\s+$/
    autocmd ColorScheme * highlight NeomakeErrorSign ctermfg=white ctermbg=darkred guibg=darkred
    autocmd ColorScheme * highlight NeomakeError ctermfg=white ctermbg=darkred guibg=darkred
    autocmd ColorScheme * highlight NeomakeWarningSign ctermfg=yellow guibg=darkred
    autocmd ColorScheme * highlight DeniteChar ctermbg=darkblue guibg=darkblue
    autocmd ColorScheme * highlight SpellBad cterm=underline
    autocmd ColorScheme dracula highlight pythonSelf guifg=#FF79C6
augroup END
set background=dark
set t_Co=256                   " 256 colors for the terminal
set termguicolors

" molokai256 lucius badwolf dracula gotham
colorscheme dracula

" Airline
set noshowmode
let g:airline_theme='dracula'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#non_zero_only = 1

" Resize the divisions if the Vim window size changes
augroup vim_resize
    autocmd!
    autocmd VimResized * wincmd =
augroup END

" Show hidden chars
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
nnoremap <Leader>h :setlocal list!<CR>

" Spelling
augroup spelling
    autocmd!
    autocmd FileType gitcommit,markdown,mkd,rst,text setlocal spell spelllang=en
augroup END

nnoremap <Leader>ss :setlocal spell! spelllang=es<CR>
nnoremap <Leader>se :setlocal spell! spelllang=en<CR>
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
nnoremap <leader>ga :Gwrite<cr>
nnoremap <Leader>go :Gread<CR>
nnoremap <Leader>gR :Gremove<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>

set diffopt+=vertical

nnoremap <Leader>gt :!tig<CR>:redraw!<CR>
nnoremap <Leader>gl :exe "silent Glog <Bar> copen"<CR>:redraw!<CR>
nnoremap <Leader>gL :exe "silent Glog -- <Bar> copen"<CR>:redraw!<CR>

nnoremap <Leader>ggc :silent! Ggrep -i<Space>
nnoremap <Leader>gg :exe 'silent Ggrep -i '.input("Pattern: ")<Bar>copen<CR>

" Gitv
nnoremap <silent> <leader>gv :Gitv --all<CR>
nnoremap <silent> <leader>gV :Gitv! --all<CR>
xnoremap <silent> <leader>gV :Gitv! --all<CR>
let g:Gitv_OpenHorizontal = 'auto'
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_DoNotMapCtrlKey = 1
augroup git_fold
    autocmd!
    autocmd FileType git setlocal nofoldenable
augroup END

" Gundo
nnoremap <Leader>u :GundoToggle<CR>
let g:gundo_prefer_python3 = 1
let g:gundo_preview_bottom = 1

" indentLine
map <silent> <Leader>L :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
let g:indentLine_char = '┊'
let g:indentLine_color_term = 239

" PythonMode
let g:pymode_rope = 1
let g:pymode_breakpoint = 0
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

nnoremap <silent><Leader>o :Denite -mode=insert file_rec<CR>
nnoremap <silent><Leader>O :Denite -mode=insert file_rec/git<CR>
nnoremap <silent><Leader>T :Denite -mode=insert -path=tests/ file_rec/git<CR>
nnoremap <silent><Leader>i :Denite outline<CR>
nnoremap <silent><leader>? :Grepper -open -switch -query 'TODO\|FIXME'<cr>
nnoremap <silent><Leader>sa :Grepper -open -switch -prompt<CR>
nnoremap <silent><leader>* :Grepper -jump -cword -noprompt<cr>
nnoremap <silent><leader>s/ :Grepper -jump -noprompt -query '<c-r>/'<cr>
nnoremap gS <plug>(GrepperOperator)
xnoremap gS <plug>(GrepperOperator)

if executable('ag')
    let g:ag_options = '--nocolor --nogroup -S -i --line-numbers ' .
        \ '--ignore-dir node_modules --ignore-dir migrations ' .
        \ '--ignore-dir static --ignore-dir media --vimgrep'
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

" vim-ansible-yaml
let g:ansible_options = {'ignore_blank_lines': 0}

" javacomplete2
nnoremap <F5> <Plug>(JavaComplete-Imports-Add)
nnoremap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
nnoremap <F6> <Plug>(JavaComplete-Imports-AddMissing)
let g:JavaComplete_ImportOrder = ['com.google.', '*', 'java.', 'javax.']
let g:JavaComplete_ImportSortType = 'packageName'
augroup plugin_java
    autocmd!
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup END

" splitjoin
let g:splitjoin_split_mapping = 'zS'
let g:splitjoin_join_mapping  = 'zJ'

" Grepper
let g:grepper = {}
let g:grepper.highlight = 1
let g:grepper.dir = 'filecwd'
let g:grepper.tools = ['ag', 'grep', 'git']
let g:grepper.prompt_quote = 1

" JavaScript
let g:jsx_ext_required = 0

" switch.vim
let g:switch_mapping = "gS"

augroup filetype_autocmd
    autocmd!
    autocmd FileType vim :setlocal foldmethod=marker
    autocmd FileType json :setlocal formatprg=python\ -m\ json.tool
    autocmd FileType json :setlocal equalprg=python\ -m\ json.tool
    autocmd FileType html,htmldjango.html inoreabbrev <buffer> --- &mdash;
    autocmd FileType typescript let g:netrw_list_hide= '.*\.js,.*\.map$'
    autocmd FileType python let g:netrw_list_hide= '.*\.pyc$'
    autocmd FileType java inoreabbrev <buffer> True true
    autocmd FileType java inoreabbrev <buffer> False false
    autocmd FileType java inoreabbrev <buffer> raise throw
    autocmd FileType python setlocal textwidth=79 colorcolumn=80 define=^\s*\\(def\\\\|class\\)
    autocmd FileType text setlocal textwidth=79 colorcolumn=80 formatoptions=qrn1ct
    autocmd FileType netrw setlocal bufhidden=wipe
    autocmd FileType python,html setlocal nowrap
    autocmd BufRead,BufNewFile */templates/*.html setlocal filetype=htmldjango.html
    autocmd FileType json,ruby,yaml,javascript,xml,css,typescript,html,htmldjango.html :setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType javascript,xml,css,java,json :setlocal foldmethod=syntax
    autocmd FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4 cinoptions+=+4s
augroup END

" Tags
set tags=.tags
augroup filetype_tag_command
    autocmd FileType python command! Ctags !ctags --languages=python -f .tags -R $(python -c "import sys; print(' '.join(sys.path))")
    autocmd FileType java command! Ctags !ctags --languages=java -f .tags -R .
augroup END

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
function! s:VSetSearch(cmdtype)
	let temp = @s
	norm! gv"sy
	let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
	let @s = temp
endfunction

xnoremap <silent> // :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>

let g:netrw_liststyle=3

noremap <Leader>r :checkt<CR>
nnoremap <c-j> :tabe<space>
nnoremap <c-t>t :tabn<cr>

" Allow to repeat in visual mode
xnoremap . :norm.<CR>

" Allow to execute the 'q' macro in visual mode
xnoremap Q :'<,'>:normal @q<CR>

" Fast window & buffer close and kill
nnoremap <Leader>k :bp\|bwipeout #<cr>
nnoremap <leader>K :bp\|bd #<cr>

" Toggle paste mode
nnoremap <Leader>P :set invpaste<CR>

" Save as root
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Delete trailing whitespaces
noremap <silent><Leader>et :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Join paragraphs in one-liners
nnoremap <silent> gL :g/./,/^$/join<cr>

map Y y$
nnoremap <Leader>m :%s/<C-r><C-w>/<C-r><C-w>/ge<Left><Left>
xnoremap <Leader>m :<BS><BS><BS><BS><BS>%s/\%V//g<Left><Left>
nnoremap <Leader>n :%s/<C-r>///ge<Left><Left><Left>
nnoremap gW :vimgrep /<C-r>//g %<cr>
nnoremap <Leader>c :%~n<cr>
nnoremap <Leader>f :%s///g<Left><Left>
nnoremap <space> :bnext<cr>
nnoremap <bs> :bprev<cr>
nnoremap \ zak<cr>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>ek :e $HOME/.vim/dictionaries/keywords.txt<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
command! -bar -range=% Isort :<line1>,<line2>! isort -
nnoremap <silent> gs m`:Isort<cr>``
command! -bar -range=% Autopep8 :<line1>,<line2>! autopep8 -
nnoremap <silent> gF m`:Autopep8<cr>``
nnoremap <silent> g/ :%s///gn<cr>
nnoremap <leader>; :execute "normal! m`A;\e``"<cr>
nnoremap <leader>B Oimport ipdb  # XXX<cr>ipdb.set_trace()<esc>
nnoremap <leader>V Ofrom IPython import embed<cr>embed()<esc>
nnoremap <leader>V Oimport traceback<cr>traceback.print_exc()<esc>
noremap <silent> gY :call yapf#YAPF()<cr>

command! Today pu=strftime('%Y/%m/%d')
command! Now pu=strftime('%Y/%m/%d %H:%M:%S')

" Select last changed (or pasted) text
nnoremap gp `[v`]
nnoremap <leader>= `[v`]=

nnoremap gy vi,o<esc>ysi,)i

nnoremap gM :Make<cr>

xnoremap <silent> gC :<c-u>setlocal textwidth=72<cr>gvgq:<c-u>setlocal textwidth=79<cr>

noremap <Leader>q :%bd\|e#<cr>
noremap <Leader>Q :bufdo bd<cr>

" mgedmin/coverage-highlight.vim  :HighlightCoverage :HighlightCoverageOff
nnoremap <silent>]w :NextUncovered<cr>
nnoremap <silent>[w :PrevUncovered<cr>

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
