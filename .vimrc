" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Plug management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
"Plug 'mattn/emmet-vim'
"Plug 'dracula/vim'
Plug 'scrooloose/nerdtree'
" Disable due to bad performance https://github.com/Xuyuanp/nerdtree-git-plugin/issues/76
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'trietphm/nerdtree-ag'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
"Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sebdah/vim-delve'
Plug 'SirVer/ultisnips'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'othree/html5.vim'
Plug 'maksimr/vim-jsbeautify'
"Plug 'elzr/vim-json'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'wellle/tmux-complete.vim'
"Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
"Plug 'FuzzyFinder'
"Plug 'jiangmiao/auto-pairs'
"Plug 'easymotion/vim-easymotion'
"Plug 'majutsushi/tagbar'
"Plug 'Shougo/echodoc.vim'
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
Plug 'mileszs/ack.vim'
"Plug 'johngrib/vim-game-code-break'
"Plug 'airblade/vim-gitgutter'
"Plug 'wakatime/vim-wakatime'
"Plug 'pangloss/vim-javascript'
"Plug 'moll/vim-node'
Plug 'w0rp/ale'
"Plug 'digitaltoad/vim-pug'
"Plug 'mustache/vim-mustache-handlebars'
"Plug 'Chiel92/vim-autoformat'
"Plug 'posva/vim-vue'
"Plug 'wookayin/vim-typora'
"Plug 'sbdchd/neoformat'
"Plug 'vim-utils/vim-ruby-fold'
"Plug 'isRuslan/vim-es6'
"Plug 'ternjs/tern_for_vim'
Plug 'Yggdroot/indentLine'
"Plug 'sonph/onehalf'
Plug 'drewtempelmeyer/palenight.vim'
" Better palenight with nvim 0.5
" Plug 'Cybolic/palenight.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'reedes/vim-pencil'

" RUBY 
" 
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
"Plug 'tpope/vim-endwise'
Plug 'ruby-formatter/rufo-vim'
Plug 'ngmy/vim-rubocop'
Plug 'danchoi/ri.vim'
Plug 'noprompt/vim-yardoc'

" Rust
Plug 'rust-lang/rust.vim'

Plug 'editorconfig/editorconfig-vim'

" Ansible
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }

" DBML
"Plug 'jidn/vim-dbml'

"Plug 'cespare/vim-toml'

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plug 'ascenator/L9', {'name': 'newL9'}

" Terraform
Plug 'hashivim/vim-terraform'

Plug 'nvim-treesitter/nvim-treesitter'
"", {'do': ':TSUpdate'}
"Plug 'nvim-treesitter/nvim-treesitter'

" Autocompletion
if has('nvim') && has('python3')
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  "Plug 'zchee/deoplete-go', { 'do': 'make'}
  "Plug 'fishbullet/deoplete-ruby'
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'roxma/nvim-yarp'
  "Plug 'autozimu/LanguageClient-neovim', {
  "  \ 'branch': 'next',
  "  \ 'do': 'bash install.sh',
  "  \ }

else
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'cakebaker/scss-syntax.vim'

" Set icons per file extension
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" Color the icon
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Show a charater | in each indent
Plug 'lukas-reineke/indent-blankline.nvim'

" Buffer line
Plug 'akinsho/bufferline.nvim'

" Lua line
Plug 'hoob3rt/lualine.nvim'

" For showing pictogram
Plug 'onsails/lspkind-nvim'

" Show color on hex text
Plug 'norcalli/nvim-colorizer.lua'

" Show git information
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" Show LSP status for statusline
Plug 'nvim-lua/lsp-status.nvim'

Plug 'neovim/nvim-lspconfig'

call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
set number

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

"set foldcolumn=4

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
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

set guicursor=n-v-c:block,i-ci-ve:ver50,r-cr:hor20,sm:block-blinkwait175-blinkoff150-blinkon175
"set guicursor=

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

set updatetime=150

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
au FileType c setlocal tabstop=2 shiftwidth=2 expandtab
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
autocmd BufWrite *.rake :call DeleteTrailingWS()
autocmd BufWrite *.yml :call DeleteTrailingWS()
autocmd BufWrite *.yaml :call DeleteTrailingWS()

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

" don't pass message to |ins-completion-menu| 
set shortmess+=c

" always show signcolumns
" FIXME can break in old vim
set signcolumn=yes


" => Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme palenight

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""
"" git gutter
let g:gitgutter_max_signs = 1000

""""""""""""""""
" bufferline
" Fast moving tab bufferline
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

"""""""""""""""""""""""
""" echo doc
"let g:echodoc#enable_at_startup = 1
"let g:echodoc#type = 'floating'
" To use a custom highlight for the float window,
" change Pmenu to your highlight group
"highlight link EchoDocFloat Pmenu

"""""""""""""""""""""""
""" ack.vim
let g:ackprg = 'ag --vimgrep'
"let g:ackpreview = 1
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
let g:ansible_attribute_highlight = "a"
let g:ansible_extra_keywords_highlight = 1
let g:ansible_loop_keywords_highlight = 'Constant' 

" Map Leader _+ p to FzfBuffer
map <leader>p :FzfBuffers<cr>

let g:fzf_tags_command = 'ctags -R'

""""""""""""""""""""""""
""" Fzf.vim
command! -bang -nargs=* Rg 
	\ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,
	\ fzf#vim#with_preview({'options': ['--delimiter=:', '--nth=2..', '--info=inline']}),
	\ <bang>0)

" Prevent Rg open inside NERD_tree
" Simply call nnoremap <C-f> :Rg<Cr> if NERD_tree is not used
nnoremap <silent> <expr> <C-f> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Rg\<cr>"


let g:fzf_preview_window = ['right:50%', 'ctrl-/']



""""""""
" NERDCommenter
filetype plugin on

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
let g:NERDTreeIgnore = ['^node_modules$']

" open NERDTree automatically on vim start, even if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Auto close NERDTree if it is the last and only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Prevent FZF open file in NERDTree
autocmd VimEnter * nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
"au BufEnter * if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree' && winnr('$') > 1 | b# | exe "normal! \<c-w>\<c-w>" | :blast | endif



" Remap next hunk
let g:NERDTreeMapNextHunk = '<leader>j'
let g:NERDTreeMapPrevHunk = '<leader>k'

"""""""""""""""""""""""
""" Deoplete
"let g:deoplete#enable_at_startup=1
"let g:deoplete#enable_smart_case = 1
"call deoplete#custom#option('auto_complete_delay', 300)

"call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" Disable deoplete when in multi cursor mode
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction
function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

set completeopt+=noinsert
set completeopt+=preview

"""""""""""""""""""""""
""" UtilSnip
if has('nvim')
  let g:UltiSnipsExpandTrigger="<c-tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-tab>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
endif

"""""""""""""""""""""""
""" Supertab
"let g:SuperTabDefaultCompletionType = '<C-n>'

"""""""""""""""""""""""
" Go config (vims-go)
"map <Leader>] :cnext<CR>
"map <Leader>[ :cprevious<CR>
nnoremap <Esc> :pc<CR> :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_fmt_command = "gopls"
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
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_doc_keywordprg_enabled = 0
au FileType go nmap gi <Plug>(go-install)
au FileType go nmap gt <Plug>(go-test)
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Fast import package
" Install https://github.com/haya14busa/gopkgs & fzf
augroup gopkgs
  autocmd!
  autocmd FileType go command! -buffer Import exe fzf#run({'source': 'gopkgs', 'sink':'GoImport', 'option': 'm+', 'down': 30})
  autocmd FileType go command! -buffer Doc exe fzf#run({'source': 'gopkgs', 'sink':'GoImport', 'option': 'm+', 'down': 30})
augroup END

map <Leader>i :call fzf#run({'source': 'gopkgs', 'sink':'GoImport', 'option': 'm+', 'down': 30})<CR>

""""""""""""""""
"" ale
" Error and warning signs.
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {
	\ 'vue': ['eslint', 'vls'], 
	\ 'yaml': [],
	\ 'json': ['jq', 'jsonlint']
	\ }
let g:ale_disable_lsp = 1
let g:ale_fixers = {
\ 'javascript': ['eslint', 'prettier', 'remove_trailing_lines'],
\ 'vue': ['eslint', 'trim_whitespace'],
\ 'yml': ['trim_whitespace'],
\ 'yaml': ['trim_whitespace'],
\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

" Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

autocmd FileType html.handlebars let b:autoformat_autoindent=1
autocmd FileType html let b:autoformat_autoindent=1
autocmd FileType vue let b:autoformat_autoindent=1

".vimrc
"map <c-f> :call JsBeautify()<cr>
" or
"autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
"" for json
"autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
"" for jsx
"autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
"" for html
"autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
"" for css or scss
"autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

augroup filetype javascript syntax=javascript

" rufo
"let g:rufo_auto_formatting = 1
map <leader>r :Rufo<cr>

set tags=./tags;,./gems.tags;

" ruby-fold
"let g:ruby_fold_lines_limit = 200

" devicons
"set guifont=DroidSansMono\ Nerd\ Font:h11

let g:indentLine_concealcursor="nc"
"let g:indentLine_char = '│'
let g:indentLine_color_gui = '#444444'
"let g:indentLine_concealcursor=0
"let g:indentLine_bgcolor_gui = '#FF5F00'
"let g:indentLine_fileTypeExclude=['tex', 'json']
let g:indentLine_setColors=1

" vue language server 
"let g:LanguageClient_serverCommands = {
"    \ 'vue': ['vls']
"    \ }
"let ayucolor="mirage"
let g:palenight_terminal_italics=1
"let g:fzf_colors = { 'hl': ['fg', 'Comment'] }

" Those shit to support italic
set t_ZH=[3m
set t_ZR=[23m
highlight Comment cterm=italic
highlight Comment gui=italic

" Fold
au FileType ruby setlocal foldmethod=indent foldnestmax=4 foldlevelstart=1
"au FileType go setlocal foldmethod=indent foldnestmax=4 foldlevelstart=1

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

"rust
let g:rustfmt_autosave = 1
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

" Terraform
" Allow vim-terraform to align settings automatically with Tabularize.
let g:terraform_align=1
" Allow vim-terraform to automatically format *.tf and *.tfvars files with terraform fmt. 
let g:terraform_fmt_on_save=1

""""""""""""""""""""""""""""""""""""""
" COC
" coc highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

let g:LanguageClient_serverCommands = {
  \ 'cpp': ['clangd'],
  \ 'c': ['clangd'],
  \ }

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-tab>'

"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? coc#_select_confirm() :
"      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"let g:coc_snippet_next = '<tab>'
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Automatically show documentation when hovering

"function! ShowDocIfNoDiagnostic(timer_id)
"  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
"    silent call CocActionAsync('doHover')
"  endif
"endfunction
"
"function! s:show_hover_doc()
"  call timer_start(3000, 'ShowDocIfNoDiagnostic')
"endfunction
"
"autocmd CursorHoldI * :call <SID>show_hover_doc()
"autocmd CursorHold * :call <SID>show_hover_doc()


" End coc.nvim config
""""""""""""""""""""""""""""""""""""""

" Custom icon color
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

" performance issue
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['go'] = s:blue " sets the color of css files to blue


" coc-go
"""""""""'
"autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')'


" Ansible vim
"""""""""""""""""""""""""

" The role's paths
let g:ansible_goto_role_paths = './roles,./ansible_galaxy'

function! FindAnsibleRoleUnderCursor()
  if exists("g:ansible_goto_role_paths")
    let l:role_paths = g:ansible_goto_role_paths
  else
    let l:role_paths = "./roles"
  endif
  let l:tasks_main = expand("<cfile>") . "/tasks/main.yml"
  let l:found_role_path = findfile(l:tasks_main, l:role_paths)
  if l:found_role_path == ""
    echo l:tasks_main . " not found"
  else
    execute "edit " . fnameescape(l:found_role_path)
  endif
endfunction

"Go to definition role 
au BufRead,BufNewFile *.yml nnoremap <leader>gr :call FindAnsibleRoleUnderCursor()<CR>
au BufRead,BufNewFile *.yml vnoremap <leader>gr :call FindAnsibleRoleUnderCursor()<CR>

""""""""""""""""
