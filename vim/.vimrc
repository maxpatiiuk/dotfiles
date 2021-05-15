" PLUGIN INDEPENDENT

" Enable line numeration
set number

" Make file folding persistent
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Change tabsize to 4
filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Higlight search results
set hls

" Set default file encoding
set encoding=UTF-8

" Show that char on line breaks
set showbreak=…

" Show vertial line past 72 chars
set colorcolumn=72

" Hard wrap text at 72 chars
set textwidth=72

" Set the directory of the current file as path
autocmd BufEnter * lcd %:p:h

" Change the swap files location
set directory^=$HOME/.vim/tmp//

" Change the viminfo file location
set viminfo+=n~/.vim/.viminfo

" Wrap lines between words
set linebreak

" Softwrap beyond 72 characters
set wrap

" Map "insert single character" to the space key
nnoremap <Space> i_<Esc>r

" Synonymize uppercase varians of common commands
command W w
command Wq wq
command Q q

" Return to `normal` mode on idle
autocmd CursorHoldI * stopinsert

" Use ctrl+shift+6 as a "caps lock" toggle
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

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

" File system explorere
Plug 'preservim/nerdtree'

" Git integration for nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Nerdtree improvments
Plug 'jistr/vim-nerdtree-tabs'

" Nerdtree file type colors
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Nerdtree file icons
Plug 'ryanoasis/vim-devicons'

" Add typescript syntax highlighting
Plug 'leafgarland/typescript-vim'

" Tabnine
Plug 'zxqfl/tabnine-vim'

call plug#end()




" PLUGIN DEPENDENT

" Set theme
syntax on
colorscheme monokai

" Make previous session open automatically
let g:startify_session_persistence=1

" Bookmark commonly used files
let g:startify_bookmarks = [ {'s':'~/site/git/private-dotfiles/notes/SPECIFY.md'}, {'k':'~/site/git/private-dotfiles/notes/KU.md'}, {'t':'~/site/git/private-dotfiles/notes/TEMP'} ]

" Show only 5 files in Startify
let g:startify_files_number = 5

" Disable Startify header
let g:startify_custom_header = []

" Toggle nerdtree
map <C-n> :NERDTreeTabsToggle<CR>

" Find currently opened file in nerdtree
map <C-s> :NERDTreeFind<CR>

" Disable folding in .md files
let g:vim_markdown_folding_disabled = 1

" Disable syntax conceal
set conceallevel=0
let g:vim_markdown_conceak=0
let g:vim_markdown_conceal_code_blocks=0
let g:vim_json_syntax_conceal=0

" Enable yaml front matter in .md files
let g:vim_markdown_frontmatter = 1

" Enable json front matter in .md files
let g:vim_markdown_json_frontmatter = 1

" Disable vim_markdown's key mappings
let g:vim_markdown_no_default_key_mappings = 1

" Pring `#` in markdown headings in red
autocmd FileType markdown highlight mkdHeading cterm=none ctermfg=9

" Print markdown headings in orange
autocmd FileType markdown highlight htmlH1 cterm=none ctermfg=220

" Enable file explorer file higlighting only for some files
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
let g:NERDTreeSyntaxEnabledExtensions = ['html', 'css', 'py', 'js', 'ts', 'tsx', 'json', 'xml', 'md', 'csv', 'tsv', 'sql', 'yaml']
let g:NERDTreeSyntaxEnabledExactMatches = ['favicon.ico', 'Makefile', '.git', '.idea']

" Higligh full filename rather than just icon
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" Let nerdtree's git integration use nerdfonts
let g:NERDTreeGitStatusUseNerdFonts = 1

" Allow nerdtree to delete files
let NERDTreeAutoDeleteBuffer = 1

" Remove help? message from nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Show hidden files in nerdtree
let NERDTreeShowHidden=1
