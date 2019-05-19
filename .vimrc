" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"set color

if has('nvim')
  set termguicolors
endif
set t_Co=256

" Map jj to Esc -> Type jj in INSERT mode to back to NORMAL mode
:imap jj <Esc>

" Reduce esc delay time 
set timeoutlen=1000 ttimeoutlen=5

set clipboard=unnamedplus

" Show line number
set relativenumber

" No beeps
set noerrorbells
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" keep 500 lines of command line history
set history=500

" show the cursor position all the time
set ruler

" display incomplete commands
set showcmd

" do incremental searching
set incsearch

" highlight line at cursor
set cursorline

" Set to autoread when a file is changed from the outside
set autoread
set autowrite

" Map leader key
let mapleader = " "	" map leader key to ,
let g:mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

syntax on
set hlsearch

" Only do this part when compiled with support for autocommands.
filetype plugin indent on
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
endif " has("autocmd")

set autoindent		" always set autoindenting on
set si " smart indent


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
			  \ | wincmd p | diffthis
endif

filetype off                  " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set scrolloff 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on WiLd menu
set wildmenu

" Ignore compiled files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" set no wrap
set nowrap

" ignore case when searching
set ignorecase

" when searching try to be smart about cases
set smartcase

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Get dialog confirm when :q, :w, :wq fails
set confirm

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Split vertical windows right to the current windows
set splitright

" Split horizontal windows below to the current windows
set splitbelow

" Remember undo after quiting
set hidden

set noshowmode

" Always show statusline
set laststatus=2

" Change cursor shape
 let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
" INSERT mode - line
let &t_SI .= "\<Esc>[5 q"
" REPLACE mode - underline
let &t_SR .= "\<Esc>[4 q"
" COMMON - block
let &t_EI .= "\<Esc>[3 q"

" for command mode
nnoremap <S-Tab> <<
nnoremap <Tab> >>

" for insert mode
inoremap <S-Tab> <C-d>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backup and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile
set backupdir=~/tmp,/tmp
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=/tmp

" Persistent undo
" Don't forget mkdir folder $HOME/.vim/undo
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <leader><cr> :noh<cr>
map <silent> <leader>s :syntax sync fromstart<cr>

" Remap to toggle between the current and the alternate file
map <leader>e <C-^>

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h

" Mapping for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>t<leader> :tabnext

" yaml indentation
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType yml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType pug setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType html setlocal tabstop=2 shiftwidth=2 expandtab
au FileType vue setlocal tabstop=2 shiftwidth=2 expandtab
au FileType eruby setlocal tabstop=2 shiftwidth=2 expandtab
au FileType scss setlocal tabstop=2 shiftwidth=2 expandtab
au FileType ruby setlocal tabstop=2 shiftwidth=2 expandtab
au FileType html.erb setlocal tabstop=2 shiftwidth=2 expandtab
au FileType html.handlebars setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>
nnoremap <leader>q :bp<cr>:bd #<cr>

" Next/Previous between buffers
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

set switchbuf=useopen,usetab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.sql :call DeleteTrailingWS()
autocmd BufWrite *.md :call DeleteTrailingWS()
autocmd BufWrite *.vue :call DeleteTrailingWS()
autocmd BufWrite *.rb :call DeleteTrailingWS()

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

call plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim'
"Plug 'dracula/vim'
Plug 'scrooloose/nerdtree'
" Disable due to bad performance https://github.com/Xuyuanp/nerdtree-git-plugin/issues/76
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'tyok/nerdtree-ack'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
"Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
if has('nvim')
  Plug 'fatih/vim-go'
  Plug 'sebdah/vim-delve'
  Plug 'SirVer/ultisnips'
endif
Plug 'AndrewRadev/splitjoin.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ternjs/tern_for_vim'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'othree/html5.vim'
Plug 'maksimr/vim-jsbeautify'
"Plug 'elzr/vim-json'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'wellle/tmux-complete.vim'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
"Plug 'FuzzyFinder'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'Shougo/echodoc.vim'
Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
Plug 'mileszs/ack.vim'
Plug 'johngrib/vim-game-code-break'
" Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'wakatime/vim-wakatime'
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'w0rp/ale'
Plug 'digitaltoad/vim-pug'
Plug 'mustache/vim-mustache-handlebars'
Plug 'Chiel92/vim-autoformat'
Plug 'posva/vim-vue'
"Plug 'sbdchd/neoformat'
"Plug 'ryanoasis/vim-devicons'
"Plug 'vim-utils/vim-ruby-fold'
Plug 'isRuslan/vim-es6'
Plug 'ternjs/tern_for_vim'
Plug 'Yggdroot/indentLine'
Plug 'sonph/onehalf'
Plug 'drewtempelmeyer/palenight.vim'

" RUBY 
" 
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'ruby-formatter/rufo-vim'
Plug 'ngmy/vim-rubocop'
Plug 'danchoi/ri.vim'
Plug 'noprompt/vim-yardoc'

Plug 'editorconfig/editorconfig-vim'

" Ansible
Plug 'pearofducks/ansible-vim'


" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plug 'ascenator/L9', {'name': 'newL9'}

" Autocompletion
if has('nvim') && has('python3')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', { 'do': 'make'}
  Plug 'fishbullet/deoplete-ruby'
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'roxma/nvim-yarp'
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

else
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'cakebaker/scss-syntax.vim'

call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme palenight

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""
"" git gutter
let g:gitgutter_max_signs = 1000

if has('nvim')
""""""""""""""""
"" ale
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_linters = {'proto': ['protoc-gen-lint']}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
endif

""""""""""""""""
" airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1


" Fast moving tab airline
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

let g:airline_theme='jellybeans'

"""""""""""""""""""""""
""" echo doc
if has('nvim')
  let g:echodoc_enable_at_startup = 1
endif

"""""""""""""""""""""""
""" ack.vim
let g:ackprg = 'ag --vimgrep'
noremap <Leader>aa :Ack! <cword><cr>
noremap <Leader>a :Ack!

"""""""""""""""""""""""
""" Fzf
let g:fzf_command_prefix = 'Fzf'
let g:fzf_buffers_jump = 1

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Map Ctrl + p to FZF
map <C-p> :FZF<cr>
map <C-b> :FzfBTags<cr>

" Map Ctrl + a to set Ansible file type
map <C-a> :set ft=yaml.ansible<cr>

" Map Leader _+ p to FzfBuffer
map <leader>p :FzfBuffers<cr>

let g:fzf_tags_command = 'ctags -R'

""""""""
" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Map Ctrl + / as commenter toggle
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

"""""""""""""""""""""""""""""""""""""
""" NERDTree
" Map Toggle NERDTree
map <Leader>n :NERDTreeToggle<CR>

" Open current file in NERDTree
map <Leader>F :NERDTreeFind<CR>

"Remap key to split screen
let NERDTreeMapOpenVSplit='<C-v>'
let NERDTreeMapOpenSplit='<C-x>'
let NERDTreeMapOpenInTab='<C-t>'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" open NERDTree automatically on vim start, even if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Auto close NERDTree if it is the last and only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Prevent FZF open file in NERDTree
autocmd VimEnter * nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"

" Remap next hunk
let g:NERDTreeMapNextHunk = '<leader>j'
let g:NERDTreeMapPrevHunk = '<leader>k'

"""""""""""""""""""""""
""" Deoplete
if has('nvim')
  let g:deoplete#enable_at_startup=1
  let g:deoplete#enable_smart_case = 1
  
  " Disable deoplete when in multi cursor mode
  function! Multiple_cursors_before()
      let b:deoplete_disable_auto_complete = 1
      let b:deoplete_disable_auto_complete = 0
  endfunction
  
  set completeopt+=noinsert
  set completeopt+=preview
endif

"""""""""""""""""""""""
""" UtilSnip
if has('nvim')
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
endif

"""""""""""""""""""""""
""" Supertab
let g:SuperTabDefaultCompletionType = '<C-n>'

if has('nvim')
  """""""""""""""""""""""
  " Go config (vims-go)
  "map <Leader>] :cnext<CR>
  "map <Leader>[ :cprevious<CR>
  nnoremap <Esc> :pc<CR> :cclose<CR>
  autocmd FileType go nmap <leader>b  <Plug>(go-build)
  autocmd FileType go nmap <leader>r  <Plug>(go-run)
  let g:go_fmt_command = "goimports"
  let g:go_fmt_autosave = 1
  let g:go_snippet_case_type = "camelcase"
  let g:go_highlight_types = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_build_constraints = 1
  let g:go_metalinter_enabled = ['vet', 'errcheck']
  let g:go_metalinter_autosave = 1
  let g:go_metalinter_autosave_enabled = ['vet']
  let g:syntastic_go_checkers = ['govet', 'errcheck']
  let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
  let g:syntastic_aggregate_errors = 1
  let g:go_list_type = "quickfix"
  let g:go_auto_type_info = 1
  set updatetime=100
  let g:go_auto_sameids = 1
  au FileType go nmap gi <Plug>(go-install)
  au FileType go nmap gt <Plug>(go-test)

  " Fast import package
  " Install https://github.com/haya14busa/gopkgs & fzf
  augroup gopkgs
    autocmd!
    autocmd FileType go command! -buffer Import exe fzf#run({'source': 'gopkgs', 'sink':'GoImport', 'option': 'm+', 'down': 30})
    autocmd FileType go command! -buffer Doc exe fzf#run({'source': 'gopkgs', 'sink':'GoImport', 'option': 'm+', 'down': 30})
  augroup END
  
  map <Leader>i :call fzf#run({'source': 'gopkgs', 'sink':'GoImport', 'option': 'm+', 'down': 30})<CR>
endif


"""""""""""""""""""""""""""""""
""" Tagbar

" Map F8 to toggle Tagbar
nmap <F8> :TagbarToggle<CR>

" Tagbar for go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
    \ }

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
    \ }

if executable('ripper-tags')
  let g:tagbar_type_ruby = {
      \ 'kinds'      : ['m:modules',
                      \ 'c:classes',
                      \ 'C:constants',
                      \ 'F:singleton methods',
                      \ 'f:methods',
                      \ 'a:aliases'],
      \ 'kind2scope' : { 'c' : 'class',
                       \ 'm' : 'class' },
      \ 'scope2kind' : { 'class' : 'c' },
      \ 'ctagsbin'   : 'ripper-tags',
      \ 'ctagsargs'  : ['-f', '-']
      \ }
endif

"""""""""""""""""""""""
""" Easy motion

" <Leader>f{char} to move to {char}
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" gitgutter
nmap <Leader>j <Plug>GitGutterNextHunk
nmap <Leader>k <Plug>GitGutterPrevHunk

if has('nvim')
  " Put this in vimrc or a plugin file of your own.
  " After this is configured, :ALEFix will try and fix your JS code with ESLint.
  let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
  let g:ale_linters = {'vue': ['eslint', 'vls']}
  let g:ale_fixers = {
  \   'javascript': ['eslint'],
  \ 'vue': ['eslint']
  \}
  
  " Set this setting in vimrc if you want to fix files automatically on save.
  " This is off by default.
  let g:ale_fix_on_save = 1
  
  " Autoformat
  let g:autoformat_autoindent = 0
  let g:autoformat_retab = 0
  let g:autoformat_remove_trailing_spaces = 0
endif

autocmd FileType html.handlebars let b:autoformat_autoindent=1
autocmd FileType html let b:autoformat_autoindent=1
autocmd FileType vue let b:autoformat_autoindent=1


if has('nvim')
	".vimrc
	map <c-f> :call JsBeautify()<cr>
	" or
	autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
	" for json
	autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
	" for jsx
	autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
	" for html
	autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
	" for css or scss
	autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

	augroup filetype javascript syntax=javascript
endif

" rufo
"let g:rufo_auto_formatting = 1
map <leader>r :Rufo<cr>

set tags=./tags;,./gems.tags;

" ruby-fold
"let g:ruby_fold_lines_limit = 200

" devicons
"set guifont=DroidSansMono\ Nerd\ Font:h11

" Customize indent line
"let g:indentLine_char = '│'
"let g:indentLine_setColors = 0
"let g:indentLine_color_term = 239
"let g:indentLine_concealcursor = 'inc'
"let g:indentLine_conceallevel = 2

let g:indentLine_concealcursor="nc"
"let g:indentLine_char = '│'
let g:indentLine_color_gui = '#444444'
"let g:indentLine_concealcursor=0
"let g:indentLine_bgcolor_gui = '#FF5F00'
"let g:indentLine_fileTypeExclude=['tex', 'json']
let g:indentLine_setColors=1

" vue language server 
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }
let ayucolor="mirage"
let g:palenight_terminal_italics=1
let g:fzf_colors = { 'hl': ['fg', 'Comment'] }

" Those shit to support italic
set t_ZH=[3m
set t_ZR=[23m
highlight Comment cterm=italic
highlight Comment gui=italic

" Fold
au FileType ruby setlocal foldmethod=indent foldnestmax=4 foldlevelstart=1

" Alt 
" Run a given vim command on the results of alt from a given path.
" See usage below.
function! AltCommand(path, vim_command)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

" Find the alternate file for the current path and open it
nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':e')<cr>

" ctags
" Open the definition in a vertical split
map <Leader>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <leader>d :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<CR>
nnoremap <C-p> :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1'})<CR>

