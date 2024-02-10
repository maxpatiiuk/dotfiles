" PLUGIN INDEPENDENT

" Enable line numeration
set number

" Make file folding persistent
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Change tabSize to 2
filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Make Vim more useful
set nocompatible

" Enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" Provide tab-completion for file-related tasks
set path+=**

" Display matching files on tab
set wildmenu

" Enhance command-line completion
set wildmenu

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Automatically toggle case sensitivity for search
set ignorecase smartcase

" Have at least 5 characters between the cursor and screen's boundary
set scrolloff=5

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show 'invisible' characters
set list
" Set characters used to indicate 'invisible' characters
set listchars=tab:▸\
set listchars+=trail:·
set listchars+=nbsp:_

" Show current mode
set showmode

" Search wraps around the file
set wrapscan

" Live update search results
set incsearch

" Preserve undo/redo history
set undodir=~/.vim/undodir
set undofile
set history=10000
set undolevels=1000
set undoreload=10000

" Make backspace work like in a regular text editor
" (convenient when writing prose)
set backspace=indent,eol,start


" Highlight search results
set hlsearch

" Set default file encoding
set encoding=UTF-8

" Show that char on line breaks
set showbreak=…

" Show vertical line past 72 chars
set colorcolumn=72

" Hard wrap text at 72 chars
set textwidth=72

" Set the directory of the current file as path
autocmd BufEnter * lcd %:p:h

" Change misc directories
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo
set viminfo+=n~/.vim/.viminfo

" Show the filename in the window titlebar
set title

" Wrap lines between words
set linebreak

" Soft wrap beyond 72 characters
set wrap

" Map "insert single character" to the space key
noremap <space>i i_<esc>r

" Don't overwrite register when pasting over selection
vnoremap p pgvy

" Don't lose selection when indenting
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Synonymise uppercase variants of common commands
command W w
command Wq wq
command Q q

" Enable file type detection
filetype on
" Treat .json files as .js
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
" Treat .md files as Markdown
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

" Use ctrl+shift+6 as a "caps lock" toggle
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

" Turn off vim's spell checker as I have a plugin for that
set nospell


" Turn on "verymagic" for regex
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//

if has('nvim')
  " Make scroll wheel behave like in Vim
  nnoremap <ScrollWheelUp> k
  nnoremap <ScrollWheelDown> j
  vnoremap <ScrollWheelUp> k
  vnoremap <ScrollWheelDown> j
endif


" Install Plug if not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" INSTALL PLUGINS
call plug#begin('~/.vim/plugged')

" Start screen
Plug 'mhinz/vim-startify'

" Theme
Plug 'crusoexia/vim-monokai'

" Javascript syntax
Plug 'pangloss/vim-javascript'

" Json syntax
Plug 'elzr/vim-json'

" Markdown syntax
Plug 'plasticboy/vim-markdown'

" File system explorer
" Plug 'preservim/nerdtree'

" Git integration for nerdtree
" Plug 'Xuyuanp/nerdtree-git-plugin'

" Nerdtree improvments
" Plug 'jistr/vim-nerdtree-tabs'

" Nerdtree file type colors
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Nerdtree file icons
" Plug 'ryanoasis/vim-devicons'

" Add typescript syntax highlighting
Plug 'leafgarland/typescript-vim'

" TabbNine
"Plug 'zxqfl/tabnine-vim'

" Spell checker
Plug 'kamykn/spelunker.vim'

" Pop-up menu for spell checker
Plug 'kamykn/popup-menu.nvim'

" Highlight current search match
Plug 'PeterRincker/vim-searchlight'

call plug#end()




" PLUGIN DEPENDENT

" Set theme
syntax on
colorscheme monokai

" Increase color contrast for comments (make them green)
hi Comment ctermfg=34

" Make previous session open automatically
let g:startify_session_persistence=1

" Bookmark commonly used files
let g:startify_bookmarks = [
\ {'s':'~/site/git/private-dotfiles/notes/SPECIFY.md'},
\ {'t':'~/site/git/private-dotfiles/notes/TEMP'},
\ ]


" Show only 5 files in Startify
let g:startify_files_number = 5

" Disable Startify header
let g:startify_custom_header = []

" Make Startify reopen last session
let g:startify_session_persistence = 1

" Toggle nerdtree
map <C-n> :NERDTreeTabsToggle<CR>

" Find currently opened file in nerdtree
map <C-s> :NERDTreeFind<CR>

" Disable folding in .md files
let g:vim_markdown_folding_disabled = 1

" Disable syntax conceal
set conceallevel=0
let g:vim_markdown_conceal=0
let g:vim_markdown_conceal_code_blocks=0
let g:vim_json_syntax_conceal=0

" Enable yaml front matter in .md files
let g:vim_markdown_frontmatter = 1

" Enable json front matter in .md files
let g:vim_markdown_json_frontmatter = 1

" Disable vim_markdown's key mappings
let g:vim_markdown_no_default_key_mappings = 1

" Print `#` in markdown headings in red
autocmd FileType markdown highlight mkdHeading cterm=none ctermfg=9

" Print markdown headings in orange
autocmd FileType markdown highlight htmlH1 cterm=none ctermfg=220

" Enable file explorer file highlighting only for some files
" let g:NERDTreeSyntaxDisableDefaultExtensions = 1
" let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
" let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
" let g:NERDTreeSyntaxEnabledExtensions = ['html', 'css', 'py', 'js', 'ts', 'tsx', 'json', 'xml', 'md', 'csv', 'tsv', 'sql', 'yaml']
" let g:NERDTreeSyntaxEnabledExactMatches = ['favicon.ico', 'Makefile', '.git', '.idea']

" Highlight full filename rather than just icon
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1

" Let nerdtree's git integration use NerdFonts
" let g:NERDTreeGitStatusUseNerdFonts = 1

" Allow nerdtree to delete files
" let NERDTreeAutoDeleteBuffer = 1

" Remove help? message from nerdtree
" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1

" Show hidden files in nerdtree
" let NERDTreeShowHidden=1

" Enable spell checker on read only files
let g:enable_spelunker_vim_on_readonly = 1

" Detect large files (over 40kb)
let g:LargeFile = 40 * 1024
augroup LargeFile
 autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

" Use default spell checker for large files
function LargeFile()
 let g:enable_spelunker_vim = 0
 set spell
endfunction

" Make `listchars` grey instead of red
highlight SpecialKey ctermfg=DarkGrey ctermbg=black guifg=grey70 guibg=black
