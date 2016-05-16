" Author: Jose Garcia (JoseKilo) jose.eduardo.gd@gmail.com
" Source: https://github.com/JoseKilo/vimrc

" To meditate mindfully demands 'an open and receptive, nonjudgmental
" awareness of your present-moment experience'.

" language en_US.UTF-8
set nocompatible

" NeoBundle auto-installation and setup
" Auto installing NeoBundle
let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif

" Call NeoBundle
if has('vim_starting')
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand($HOME.'/.vim/bundle/'))

" is better if NeoBundle rules NeoBundle (needed!)
NeoBundle 'Shougo/neobundle.vim'

" Vimproc to asynchronously run commands (NeoBundle, Unite)
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Unite. The interface to rule almost everything
NeoBundle 'Shougo/unite.vim'

" Unite sources
NeoBundleLazy 'Shougo/unite-outline', {'autoload':{'unite_sources':'outline'}}
NeoBundleLazy 'tsukkee/unite-help', {'autoload':{'unite_sources':'help'}}
NeoBundleLazy 'ujihisa/unite-colorscheme', {'autoload':{'unite_sources':
            \ 'colorscheme'}}
NeoBundleLazy 'ujihisa/unite-locate', {'autoload':{'unite_sources':'locate'}}
NeoBundleLazy 'thinca/vim-unite-history', { 'autoload' : { 'unite_sources' :
            \ ['history/command', 'history/search']}}
NeoBundleLazy 'osyo-manga/unite-filetype', { 'autoload' : {'unite_sources' :
            \ 'filetype', }}
NeoBundleLazy 'osyo-manga/unite-quickfix', {'autoload':{'unite_sources':
            \ ['quickfix', 'location_list']}}
NeoBundleLazy 'osyo-manga/unite-fold', {'autoload':{'unite_sources':'fold'}}
NeoBundleLazy 'tacroe/unite-mark', {'autoload':{'unite_sources':'mark'}}
NeoBundleLazy 'Shougo/neomru.vim', {'autoload':{'unite_sources':
            \['file_mru', 'directory_mru']}}

" File explorer
NeoBundle 'vim-scripts/The-NERD-tree'

" Junk files
NeoBundleLazy 'Shougo/junkfile.vim', {'autoload':{'commands':'JunkfileOpen',
            \ 'unite_sources':['junkfile','junkfile/new']}}

" Unite plugin that provides command line completition
NeoBundle 'joedicastro/unite-cmdmatch'

" Unite plugin that provides spell suggestions
NeoBundle 'jbking/unite-spell-suggest'

" Dark themes
" Improved terminal version of molokai, almost identical to the GUI one
NeoBundle 'joedicastro/vim-molokai256'

NeoBundle 'tomasr/molokai'
NeoBundleLazy 'sjl/badwolf', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}
NeoBundleLazy 'nielsmadan/harlequin', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}

" Light themes
NeoBundleLazy 'vim-scripts/summerfruit256.vim', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}
NeoBundleLazy 'joedicastro/vim-github256', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}

" Make terminal themes from GUI themes
NeoBundleLazy 'godlygeek/csapprox', { 'autoload' :
        \ { 'commands' : ['CSApprox', 'CSApproxSnapshot']}}

" Admin Git
NeoBundle 'tpope/vim-fugitive'
" Show git repository changes in the current file
NeoBundle 'airblade/vim-gitgutter'
" Git viewer
NeoBundleLazy 'gregsexton/gitv', {'depends':['tpope/vim-fugitive'],
            \ 'autoload':{'commands':'Gitv'}}
" Browse GitHub events in Vim
NeoBundle 'joedicastro/vim-github-dashboard'

" Markdown Syntax
NeoBundleLazy 'joedicastro/vim-markdown'
" Makes a Markdown Extra preview into the browser
NeoBundleLazy 'joedicastro/vim-markdown-extra-preview'
" reStructuredText in vim. Your personal Wiki in RST
NeoBundleLazy 'Rykka/riv.vim', {'autoload': {'filetypes': ['rst']}}
NeoBundleLazy 'Rykka/clickable.vim', {'autoload': {'filetypes': ['rst']}}

" A diff tool for directories
NeoBundleLazy 'joedicastro/DirDiff.vim', { 'autoload': { 'commands' : 'DirDiff'}}
" Hexadecimal editor
NeoBundle 'Shougo/vinarise.vim'

" Autocompletion
NeoBundle 'Shougo/neocomplete.vim'
" Rope
" NeoBundle 'sontek/rope-vim'
" A Python plugin
NeoBundleLazy 'klen/python-mode', {'autoload': {'filetypes': ['python']}}
" Admin virtualenvs
NeoBundle 'jmcantrell/vim-virtualenv'
" Show indent lines
NeoBundleLazy 'Yggdroot/indentLine', {'autoload': {'filetypes': ['python']}}
" Show reports from coverage.py
NeoBundleLazy 'alfredodeza/coveragepy.vim', {'autoload': {'filetypes': ['python']}}
" Sort imports
 NeoBundle 'fisadev/vim-isort', {'autoload': {'filetypes': ['python']}}

" Powerful and advanced Snippets tool
NeoBundle 'SirVer/ultisnips'
" Snippets for Ultisnips
NeoBundle 'honza/vim-snippets'

NeoBundleLazy 'elzr/vim-json', {'filetypes' : 'json'}
" Remove 'po' and leave the list empty if it fails
NeoBundleLazy 'vim-scripts/po.vim--gray', {'autoload': {'filetypes': ['po']}}
NeoBundleLazy 'joedicastro/vim-pentadactyl', {
            \ 'autoload': {'filetypes': ['pentadactyl']}}
NeoBundle 'scrooloose/syntastic'

" Open a url into the browser or another files with an external app
NeoBundle 'vim-scripts/utl.vim'

" Autocompletion of (, [, {, ', ", ...
NeoBundle 'delimitMate.vim'
" Smart and fast date changer
NeoBundle 'tpope/vim-speeddating'
" to surround vim objects with a pair of identical chars
NeoBundle 'tpope/vim-surround'
" extend repetitions by the 'dot' key
NeoBundle 'tpope/vim-repeat'
" toggle comments
NeoBundle 'tpope/vim-commentary'
" smart digraphs insertion
NeoBundle 'Rykka/easydigraph.vim'
" browse the vim undo tree
NeoBundleLazy 'sjl/gundo.vim', { 'autoload' : {'commands': 'GundoToggle'}}
" to insert lorem ipsum blocks
NeoBundleLazy 'vim-scripts/loremipsum', { 'autoload' :
            \ { 'commands' : 'Loremipsum'}}
" reveals all the character info, Unicode included
NeoBundle 'tpope/vim-characterize'
" transpose lines and text blocks
NeoBundleLazy 'salsifis/vim-transpose', { 'autoload' :
            \ { 'commands' : 'Transpose'}}
" marks admin
NeoBundle 'kshenoy/vim-signature'
" text-objects
NeoBundle 'kana/vim-textobj-entire' " ae, ie
NeoBundle 'kana/vim-textobj-indent' " ai, ii, aI, iI
NeoBundle 'kana/vim-textobj-lastpat' " a/, i/, a?, i?
NeoBundle 'kana/vim-textobj-line' " al, il
NeoBundle 'kana/vim-textobj-underscore' " a_, i_
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'bps/vim-textobj-python'

" A smart and powerful Color Management tool. Needs to be loaded to be able
" to use the mappings
NeoBundleLazy 'Rykka/colorv.vim', {'autoload' : {
            \ 'commands' : [
                             \ 'ColorV', 'ColorVView', 'ColorVPreview',
                             \ 'ColorVPicker', 'ColorVEdit', 'ColorVEditAll',
                             \ 'ColorVInsert', 'ColorVList', 'ColorVName',
                             \ 'ColorVScheme', 'ColorVSchemeFav',
                             \ 'ColorVSchemeNew', 'ColorVTurn2'],
            \ }}

NeoBundleLazy 'othree/html5.vim', {'autoload':
            \ {'filetypes': ['html', 'xhttml', 'css']}}

NeoBundleLazy 'mattn/emmet-vim', {'autoload':
            \ {'filetypes': ['html', 'xhttml', 'css', 'xml', 'xls', 'markdown']}}

NeoBundle 'kchmck/vim-coffee-script',{'autoload' : {
            \ 'commands' : [
                             \ 'CoffeeCompile', 'CoffeeLint', 'CoffeeMake',
                             \ 'CoffeeRun', 'CoffeeWatch'],
            \ 'filetypes' : ['coffee']
            \ }}

" A better looking status line
NeoBundle 'bling/vim-airline'
" Zooms a window
NeoBundleLazy 'vim-scripts/zoomwintab.vim', {'autoload' :
            \{'commands' : 'ZoomWinTabToggle'}}
" easily window resizing
NeoBundle 'jimsei/winresizer'

" Easily interacts with Tmux from Vim
NeoBundle 'benmills/vimux'
" Tmux config file syntax
NeoBundleLazy 'vimez/vim-tmux', { 'autoload' : { 'filetypes' : 'conf'}}

NeoBundle 'mattn/webapi-vim'

call neobundle#end()

" First-time plugins installation
if iCanHazNeoBundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    set nomore
    NeoBundleInstall
endif

" Check if all of the plugins are already installed, in other case ask if we
" want to install them (useful to add plugins in the .vimrc)
NeoBundleCheck

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

" History and permanent undo levels
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
set autoindent                 " set on the auto-indent
" set formatoptions=qrn1ct
set textwidth=80
set colorcolumn=81

" Autocompletion
set complete=.,w,b,u,t,i,kspell

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

" Colorscheme
syntax enable                  " enable the syntax highlight
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
endif

" Font
set guifont=Dejavu\ Sans\ Mono\ for\ Powerline\ 11

" Resize the divisions if the Vim window size changes
au VimResized * exe "normal! \<c-w>="

" New windows
nnoremap <Leader>v <C-w>v
nnoremap <Leader>h <C-w>s

" Fast window moves
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Fast window & buffer close and kill
nnoremap <Leader>k <C-w>c
nnoremap <silent><Leader>K :bd<CR>

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
nmap <Leader>eh :set list!<CR>
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

" Folding
set foldmethod=marker
nnoremap \ za
vnoremap \ za

" Cut/Paste
" to/from the clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p

" toggle paste mode
map <Leader>P :set invpaste<CR>

" Autoload configuration when this file changes ($MYVIMRC)
autocmd! BufWritePost vimrc source %

" Spelling
" turn on the spell checking and set the Spanish language
nmap <Leader>ss :setlocal spell! spelllang=es<CR>
" turn on the spell checking and set the English language
nmap <Leader>se :setlocal spell! spelllang=en<CR>
" turn off the spell checking
nmap <Leader>so :setlocal nospell <CR>
" jump to the next bad spell word
nmap <Leader>sn ]s
" suggest words
" nmap <Leader>sp z=
nmap <Leader>sp :Unite spell_suggest<CR>
" jump to the next bad spell word and suggests a correct one
" nmap <Leader>sc ]sz=
nmap <Leader>sc ]s :Unite spell_suggest<CR>
" add word to the dictionary
nmap <Leader>sa zg

" Save as root
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" Quick saving
nmap <silent> <Leader>w :update<CR>

" Delete trailing whitespaces
nmap <silent><Leader>et :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Toggle the Quickfix window
function! s:QuickfixToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            lclose
            return
        endif
    endfor
    copen
endfunction
command! ToggleQuickfix call <SID>QuickfixToggle()
nnoremap <silent> <Leader>q :ToggleQuickfix<CR>

" Text statistics
" get the total of lines, words, chars and bytes (and for the current position)
" map <Leader>es g<C-G>

" get the word frequency in the text
function! WordFrequency() range
  let all = split(join(getline(a:firstline, a:lastline)), '\A\+')
  let frequencies = {}
  for word in all
    let frequencies[word] = get(frequencies, word, 0) + 1
  endfor
  let lst = []
  for [key,value] in items(frequencies)
    call add(lst, value."\t".key."\n")
  endfor
  call sort(lst)
  echo join(lst)
endfunction
command! -range=% WordFrequency <line1>,<line2>call WordFrequency()
map <Leader>ef :Unite output:WordFrequency<CR>

" Count lines of code
function! LinesOfCode()
    echo system('cloc --quiet '.bufname("%"))
endfunction

" Toggle the search results highlighting
map <silent><Leader>eq :set invhlsearch<CR>

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
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" Quick exiting without save
nnoremap <Leader>`` :qa!<CR>

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

" Load matchit by default
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" PLUGINS

" Airline
set noshowmode
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled =                                                   0
let g:airline#extensions#hunks#non_zero_only = 1
" let g:airline#extensions#tabline#enabled = 2
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#buffer_min_count = 1

" CoffeeScript
map <Leader>rw :CoffeeWatch vert<CR>

" ColorV
let g:colorv_cache_file=$HOME.'/.vim/tmp/vim_colorv_cache'
let g:colorv_cache_fav=$HOME.'/.vim/tmp/vim_colorv_cache_fav'

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
nnoremap <Leader>gS :exe "silent !shipit"<CR>:redraw!<CR>
nnoremap <Leader>gg :exe 'silent Ggrep -i '.input("Pattern: ")<Bar>Unite
            \ quickfix -no-quit<CR>
nnoremap <Leader>ggm :exe 'silent Glog --grep='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>
nnoremap <Leader>ggt :exe 'silent Glog -S='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>

nnoremap <Leader>ggc :silent! Ggrep -i<Space>
nnoremap <leader>ga :silent! Git add %<cr>:redraw!<cr>

" for the diffmode
noremap <Leader>du :diffupdate<CR>

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

" GitHub dashboard
nnoremap <Leader>gD :exe 'GHD! '.input("Username: ")<CR>
nnoremap <Leader>gA :exe 'GHA! '.input("Username or repository: ")<CR>
function! GHDashboard (...)
  if &filetype == 'github-dashboard'
    " first variable is the statusline builder
    let builder = a:1
    call builder.add_section('airline_a', 'GitHub ')
    call builder.add_section('airline_b',
                \ ' %{get(split(get(split(github_dashboard#statusline(), " "),
                \ 1, ""), ":"), 0, "")} ')
    call builder.add_section('airline_c',
                \ ' %{get(split(get(split(github_dashboard#statusline(), " "),
                \ 2, ""), "]"), 0, "")} ')
    " tell the core to use the contents of the builder
    return 1
  endif
endfunction
autocmd FileType github-dashboard call airline#add_statusline_func('GHDashboard')

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

" Neobundle
let g:neobundle#log_filename = $HOME.'/.vim/tmp/neobundle.log'

" neomru
let g:neomru#file_mru_path = $HOME.'/.vim/tmp/neomru/file'
let g:neomru#directory_mru_path = $HOME.'/.vim/tmp/neomru/directory'

" Po.vim
let g:po_translator = "Jose Garcia (JoseKilo)<jose.eduardo.gd@gmail.com>"

" PythonMode
nmap <silent><Leader>n :PymodeLint<CR>
let g:pymode_breakpoint_bind = '<Leader>B'
let g:pymode_lint = 0  " Use Syntastic instead (this doesn't work with flake8)
let g:pymode_lint_on_write = 1
let g:pymode_lint_on_fly = 1
" let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe', 'pep257']
let g:pymode_lint_checkers = ['flake8']
let g:pymode_lint_options_flake8 = ['--first']
let g:pymode_lint_ignore = ''
let g:pymode_lint_cwindow = 0
let g:pymode_virtualenv = 1
let g:pymode_rope = 1  " Danger !!!
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_lookup_project = 0
" let g:pymode_rope_project_root = "."
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_autoimport = 0  " Seriously, DON'T
" let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime'])
" let g:pymode_rope_autoimport_import_after_complete = 1
let g:pymode_doc = 0
set completeopt=menu

" Syntastic
nmap <silent><Leader>N :SyntasticCheck<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_check_on_open = 1
" let g:syntastic_python_pylint_exe = "pylint2"
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['python', 'css', 'json', 'javascript'],
            \ 'passive_filetypes': ['po'] }
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol  = '⚡'
let g:syntastic_style_warning_symbol  = '⚡'

" let g:syntastic_javascript_jshint_exec = 'jshint'
" let g:syntastic_javascript_jscs_exec = 'jscs'
" let g:syntastic_css_csslint_exec = 'csslint'

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
" files
nnoremap <silent><Leader>o :Unite -silent -start-insert file<CR>
nnoremap <silent><Leader>O :Unite -silent -start-insert file_rec/git<CR>
nnoremap <silent><Leader>m :Unite -silent file_mru<CR>
" buffers
nnoremap <silent><Leader>b :Unite -silent buffer<CR>
" tabs
nnoremap <silent><Leader>B :Unite -silent tab<CR>
" buffer search
nnoremap <silent><Leader>f :Unite -silent -no-split -start-insert -auto-preview
            \ line<CR>
nnoremap <silent>[menu]8 :UniteWithCursorWord -silent -no-split -auto-preview
            \ line<CR>
" yankring
nnoremap <silent><Leader>i :Unite -silent history/yank<CR>
" help
nnoremap <silent> g<C-h> :UniteWithCursorWord -silent help<CR>
" tasks
nnoremap <silent><Leader>; :Unite -silent -toggle
            \ grep:%::FIXME\|TODO\|NOTE\|XXX\|COMBAK\|@todo<CR>
" outlines (also ctags)
nnoremap <silent><Leader>tl :Unite -silent -vertical -winwidth=40
            \ -direction=topleft -toggle outline<CR>
" junk files
nnoremap <silent><Leader>d :Unite -silent junkfile/new junkfile<CR>
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
            \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))

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
let g:unite_source_file_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '

if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -S -i --line-numbers --ignore-dir migrations --ignore-dir env --ignore-dir .venv --ignore-dir static --ignore-dir media --ignore-dir ".*" --ignore-dir fixtures --ignore-dir mekami-web'
    let g:unite_source_grep_recursive_opt='-r'
    let g:unite_source_grep_search_word_highlight = 1
endif

let g:junkfile#directory=expand($HOME."/.vim/tmp/junk")

" Utl
map <Leader>j :Utl <CR><Bar>:redraw!<CR>
let g:utl_cfg_hdl_scm_http_system = "silent !firefox %u &"
let g:utl_cfg_hdl_mt_application_pdf = 'silent :!zathura %p &'
let g:utl_cfg_hdl_mt_image_jpeg = 'silent :!sxiv %p &'
let g:utl_cfg_hdl_mt_image_gif = 'silent :!sxiv %p &'
let g:utl_cfg_hdl_mt_image_png = 'silent :!sxiv %p &'

" Vim-markdown-extra-preview
" map <LocalLeader>mp :Me<CR>
" map <LocalLeader>mr :Mer<CR>
" let g:VMEPextensions = ['extra', 'codehilite']
" let g:VMEPhtmlreader= '/usr/bin/chromium'

" vimux
let g:VimuxUseNearestPane = 1
map <Leader>rr :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;python2 '.bufname("%"))<CR>
map <Leader>r3 :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;python3 '.bufname("%"))<CR>
map <Leader>rt :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;time python2 '.bufname("%"))<CR>
map <Leader>rp :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;time pypy '.bufname("%"))<CR>
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

" Winresizer
let g:winresizer_start_key = '<C-C><C-W>'
" cancel pressing ESC
" let g:winresizer_finish_with_escape = 1
let g:winresizer_keycode_finish = 27

" zoomwintab
map <Leader>z :ZoomWinTabToggle<CR>

" FILETYPES
augroup json_autocmd
    autocmd!
    autocmd FileType json set foldmethod=syntax
    autocmd FileType json set foldlevel=99
augroup END
augroup markdown_autocmd
    autocmd!
    autocmd FileType markdown NeoBundleSource vim-markdown
    autocmd FileType markdown NeoBundleSource vim-markdown-extra-preview
    autocmd FileType markdown set foldlevel=99
augroup END
augroup rst_autocmd
    autocmd!
    autocmd FileType rst set foldlevel=99
augroup END
au BufRead,BufNewFile */templates/*.html setlocal filetype=htmldjango.html
au BufRead,BufNewFile rc.lua setlocal foldmethod=marker
au FileType python setlocal foldlevel=99
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
au FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2

nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>rr :lnext<CR>
nnoremap <Leader>ss :lprev<CR>
nnoremap <Leader>e :%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>
vnoremap <Leader>e :<BS><BS><BS><BS><BS>%s/\%V//g<Left><Left>
nnoremap <Leader>w :w<CR>
nnoremap <space> za
noremap - ddp
noremap _ ddkkp
noremap -c ddO
vnoremap \ U
inoremap <c-d> <esc>dd
" nnoremap <c-u> viwU
" inoremap <c-u> <esc>viwUwi
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>
" inoremap jk <esc>
nnoremap Y y$

" inoremap <esc> <nop>
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

let g:AutoCloseExpandSpace = 0 " Make iabbrev work again
let g:pymode_rope_autoimport = 0  " Danger !!!
" let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime', 'itertools']
" let g:pymode_debug = 1
let pymode_rope_regenerate_on_write = 0

inoreabbrev @@@ jose.eduardo.gd@gmail.com
inoreabbrev ccop Copyright, all rights reserved.
inoreabbrev ssig --<cr>Jose Garcia (Jose Kilo)<cr>jose.eduardo.gd@gmail.com
inoreabbrev ttest def test_(self):<cr>self.assertEqual('', '')

augroup filetype_html
    autocmd!
    autocmd BufRead,BufNewFile *.html setlocal nowrap
    autocmd FileType html :inoreabbrev <buffer> --- &mdash;
    set expandtab                  " spaces instead of tabs
    set tabstop=2                  " a tab = two spaces
    set shiftwidth=2               " number of spaces for auto-indent
    set softtabstop=2              " a soft-tab of two spaces
    set autoindent                 " set on the auto-indent
augroup END
augroup filetype_js
    autocmd!
    autocmd BufRead,BufNewFile *.js setlocal nowrap
    set expandtab                  " spaces instead of tabs
    set tabstop=4                  " a tab = four spaces
    set shiftwidth=4               " number of spaces for auto-indent
    set softtabstop=4              " a soft-tab of four spaces
    set autoindent                 " set on the auto-indent
    set foldmethod=syntax
    set foldlevelstart=99
    let javaScript_fold=1
    set syntax=javascript
    set textwidth=120
    set colorcolumn=121
    syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
augroup END
augroup filetype_python
    autocmd!
    autocmd FileType python :inoreabbrev <buffer> iif if:<left>
    autocmd FileType python :inoreabbrev <buffer> wwh while:<left>
    autocmd FileType python :inoreabbrev <buffer> ffo for i in:<left>
    autocmd FileType python :inoreabbrev <buffer> rrr return
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
nnoremap <leader>/ :nohlsearch<cr>
nnoremap <leader>tt :execute "!python manage.py test --noinput -s -x --settings=$DJANGO_SETTINGS %"<cr>:redraw!<cr>
nnoremap <leader>ttt :execute "!python manage.py test --noinput -s -x --settings=$DJANGO_SETTINGS"<cr>:redraw!<cr>
nnoremap <leader>nn :set nonumber norelativenumber<cr>

nnoremap <leader>t :call <SID>testCurrentTest()<cr>

function! s:testCurrentTest()
    let saved_unnamed_register = @@
    execute "normal! ?^class\ \rwyiw\<c-o>"
    let class_name = @@
    execute "normal! ?def test_\rwyiw\<c-o>"
    let test_name = @@
    execute "!python manage.py test --noinput -s -x --settings=$DJANGO_SETTINGS %:" . class_name . "." . test_name
    redraw!
    let @@ = saved_unnamed_register
endfunction

nnoremap <leader>ff :call <SID>FoldColumnToggle()<cr>

function! s:FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction

vnoremap <leader>m :<c-u>call <SID>Search()<cr>

function! s:Search()
    let saved_register = @@
    execute "normal! `<v`>y/\<c-r>\"\r"
    let @@ = saved_register
endfunction

nnoremap <silent><Leader>aa :Unite -silent grep<CR>
nnoremap <silent><Leader>a :UniteWithCursorWord -silent grep<CR>
nnoremap <leader>ag :silent execute "grep! -R " . shellescape(expand("<cword>")) . " $SRC"<cr>:copen 5<cr>:redraw!<cr>
nnoremap <leader>an :cnext<cr>
nnoremap <leader>ap :cprevious<cr>
nnoremap <leader>ao :copen 5<cr>
nnoremap <leader>ac :cclose<cr>
nnoremap <leader>aaa :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>xyz :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)

    let saved_unnamed_register = @@

    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " . --exclude-dir=$VIRTUAL_ENV --exclude-dir=.[a-zA-Z0-9]* --exclude=*.pyc"
    copen
    redraw!

    let @@ = saved_unnamed_register

endfunction

" Functional

function! Sorted(l)
    let new_list = deepcopy(a:l)
    call sort(new_list)
    return new_list
endfunction

function! Reversed(l)
    let new_list = deepcopy(a:l)
    call reverse(new_list)
    return new_list
endfunction

function! Append(l, val)
    let new_list = deepcopy(a:l)
    call add(new_list, a:val)
    return new_list
endfunction

function! Assoc(l, i, val)
    let new_list = deepcopy(a:l)
    call new_list[a:i] = a:val
    return new_list
endfunction

function! Pop(l, i)
    let new_list = deepcopy(a:l)
    call remove(new_list, a:i)
    return new_list
endfunction

function! Mapped(fn, l)
    let new_list = deepcopy(a:l)
    call map(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction

function! Filtered(fn, l)
    let new_list = deepcopy(a:l)
    call filter(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction

function! Removed(fn, l)
    let new_list = deepcopy(a:l)
    call filter(new_list, '!' . string(a:fn) . '(v:val)')
    return new_list
endfunction

function! Reduced(fn, l)
    let new_list = deepcopy(a:l)
    if len(a:l) ==# 0
        return []
    elseif len(a:l) ==# 1
        return new_list[0]
    else
        return a:fn(new_list[0], Reduced(a:fn, new_list[1:]))
    endif
endfunction

if filereadable(".vimrc") && $PWD != $HOME
    source .vimrc
endif

let g:netrw_liststyle=3
nnoremap <Leader>ee :vsplit<CR>:Explore<CR>
noremap <Leader>y :<C-U>silent'<,'>w !xclip -sel clip<CR>
noremap <Leader>r :checkt<CR>

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Add the virtualenv's site-packages to vim path
py << EOF
import os
import os.path
import sys
import vim
import logging
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
    sys.stdout = open(os.devnull, 'w')
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', '')
EOF
