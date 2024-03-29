set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'gustavowt/vim-railscasts-theme'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'groenewege/vim-less'
Plugin 'vim-ruby/vim-ruby'
Plugin 'skammer/vim-css-color'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-rails'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-endwise'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'leafgarland/typescript-vim'
Plugin 'unkiwii/vim-nerdtree-sync'
Plugin 'dense-analysis/ale'
Plugin 'nicwest/vim-camelsnek'
Plugin 'tmhedberg/matchit'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

Plugin 'SirVer/ultisnips'

set tags=./tags;

" Touchbar
an TouchBar.Navigate.Next  :next<CR>
an TouchBar.Navigate.Prev  :prev<CR>
an TouchBar.Hello          :echo "Hello"<CR>
inoremenu TouchBar.-characterpicker-	<Nop>

" ack.vim using silver searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme railscasts
set t_Co=256          " 256 colors scheme
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8
set scrolloff=2       " Show 2 lines of context around the cursor.
set sidescrolloff=3   " Show 3 columns of context around the cursor.
set visualbell        " No beeping.
set noerrorbells      " don't beep
set autoindent        " make new lines keep current indentation
set hidden            " Navigate through buffers without vim whinings on unsaved buffers
set nofoldenable      " No folding
set shell=/usr/local/bin/fish
set splitbelow
set background=dark

" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" mouse type
set mouse=a

" Remember last location in file, but not for commit messages (see :help last-position-jump)
autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif

" exit insert mode on write and focus lost
autocmd BufWrite,TabLeave * stopinsert

" Turn on filetype plugins (:help filetype-plugin)
filetype plugin indent on

""
"" Whitespace
""
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set nolist                        " Hide invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

if exists("g:enable_mvim_shift_arrow")
  let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys
endif

""
"" List chars
""
set listchars=""                  " Reset the listchars
set listchars=tab:▸\              " a tab should display as "▸"
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=eol:¬              " show end of line as "¬"
set listchars+=extends:>          " The character to show in the last column when wrap is off and the line goes beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is off and the line goes beyond the left of the screen

""
"" Searching
""
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
""
"" Ctrl-P rejections (improve performance)
""
""let g:ctrlp_user_command = ['.git/',  'git --git-dir=%s/.git ls-files -oc --exclude-standard', 'node_modules/', 'app/javascript/']
""if executable('rg')
""  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
""endif
"" FZF
set rtp+=/usr/local/bin/fzf
nnoremap <silent> <C-p> :Files<CR>
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" - Popup window (center of the current window)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }
let g:fzf_tags_command = 'ctags -R'
""
"" Wild settings
""
set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Ignore rails stuff
set wildignore+=data,tmp,vendor,log,script

""
"" Backup and swap files
""
set backupdir=~/.vim/_backup/    " where to put backup files.
set noswapfile                   " disable swap files.
set mmp=5000

""
"" Status Line
""
set laststatus=2
set statusline=%<\ %f\ %m%r%y%=%30.([%l,%c]\ [%P]\ \ %)

""
"" Mappings
""
" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
cmap w!! %!sudo tee > /dev/null %

" Y copies until the end of the line
nnoremap Y y$

" Change selected text from name_like_this to NameLikeThis.

" Terminal commands
nmap <leader>t :terminal ++rows=10<CR>
" Double escape for normal mode on terminal
tnoremap <Esc><Esc> <C-\><C-n>

" Ale fixed
nmap <leader>fr :ALEFix rubocop<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" Kwbd mappings
map <leader>x :Kwbd<CR>

" NERDTree mappings
map <leader>n :NERDTreeToggle<CR>
nmap <leader>rn :NERDTreeFind<CR>

" BufferGator mappings
nmap <leader>b :BuffergatorToggle<CR>

" camelcase
nmap <leader>c :Camel<CR>

" Fugitive mappings
map <leader>gb :Gblame<CR>
map <leader>gs :Gstatus<CR>
map <leader>gc :Gcommit<CR>

" Set ruby file type
map <leader>rf :set ft=ruby<CR>

" UltiSnips
map <leader>s :UltiSnipsEdit<CR>
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Map Command-# and Leader-# to switch tabs
map  <D-0> 0gt
imap <D-0> <Esc>0gt
map  <leader>0 0gt
map  <D-1> 1gt
imap <D-1> <Esc>1gt
map  <leader>1 1gt
map  <D-2> 2gt
imap <D-2> <Esc>2gt
map  <leader>2 2gt
map  <D-3> 3gt
imap <D-3> <Esc>3gt
map  <leader>3 3gt
map  <D-4> 4gt
imap <D-4> <Esc>4gt
map  <leader>4 4gt
map  <D-5> 5gt
imap <D-5> <Esc>5gt
map  <leader>5 5gt
map  <D-6> 6gt
imap <D-6> <Esc>6gt
map  <leader>6 6gt
map  <D-7> 7gt
imap <D-7> <Esc>7gt
map  <leader>7 7gt
map  <D-8> 8gt
imap <D-8> <Esc>8gt
map  <leader>8 8gt
map  <D-9> 9gt
imap <D-9> <Esc>9gt
map  <leader>9 9gt

""
"" Auto Strip
""
function! <SID>StripTrailingWhitespaces()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " Do the business:
        %s/\s\+$//e
        " Clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

""
"" Filetype
""
autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
autocmd BufNewFile,BufRead *.json set ft=javascript

""
"" Plugin settings
""

"" Buffergator
let g:buffergator_autoexpand_on_split = 0
let g:buffergator_suppress_keymaps = 1

"" NERDCommenter
let g:NERDSpaceDelims = 1      " add space to the right of the comment delimiter

"" NERDTree
let NERDTreeMinimalUI = 1"

"" Airline
let g:airline_powerline_fonts=1

"" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:snipMate = { 'snippet_version' : 1 }

"" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"


" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
