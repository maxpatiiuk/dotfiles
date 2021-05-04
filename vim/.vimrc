" PLUGIN INDEPENDENT

" enable line numeration
set number

" make file folding persistent
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" change tabsize to 4
filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" higlight search results
set hls

" set default file encoding
set encoding=UTF-8

" show that char on line breaks
set showbreak=…

" show vertial line past 72 chars
set colorcolumn=72

" hard wrap text at 72 chars
set textwidth=72

" set the directory of the current file as path
autocmd BufEnter * lcd %:p:h

" change the swap files location
set directory^=$HOME/.vim/tmp//

" change the viminfo file location
set viminfo+=n~/.vim/.viminfo

" wrap lines between words
set linebreak

" softwrap beyond 72 characters
set wrap

" map "insert single character" to the space key
nnoremap <Space> i_<Esc>r

" synonymize uppercase varians of common commands
command W w
command Wq wq
command Q q

" return to `normal` mode on idle
autocmd CursorHoldI * stopinsert

" use ctrl+shift+6 as a "caps lock" toggle
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

" INSTALL PLUGINS
call plug#begin('~/.vim/plugged')

" start screen
Plug 'mhinz/vim-startify'

" theme
Plug 'crusoexia/vim-monokai'

" javascript syntax
Plug 'pangloss/vim-javascript'

" json syntax
Plug 'elzr/vim-json'

" markdown syntax
Plug 'plasticboy/vim-markdown'

" file system explorere
Plug 'preservim/nerdtree'

" git integration for nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" nerdtree improvments
Plug 'jistr/vim-nerdtree-tabs'

" nerdtree file type colors
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" nerdtree file icons
Plug 'ryanoasis/vim-devicons'

" add typescript syntax highlighting
Plug 'leafgarland/typescript-vim'

" tabnine
Plug 'zxqfl/tabnine-vim'

call plug#end()




" PLUGIN DEPENDENT

" set theme
syntax on
colorscheme monokai

" make previous session open automatically
let g:startify_session_persistence=1

" bookmark commonly used files
let g:startify_bookmarks = [ {'s':'~/site/git/private-dotfiles/notes/SPECIFY.md'}, {'k':'~/site/git/private-dotfiles/notes/KU.md'}, {'t':'~/site/git/private-dotfiles/notes/TEMP'} ]

" show only 5 files in Startify
let g:startify_files_number = 5

" disable Startify header
let g:startify_custom_header = []

" toggle nerdtree
map <C-n> :NERDTreeTabsToggle<CR>

" find currently opened file in nerdtree
map <C-s> :NERDTreeFind<CR>

" disable folding in .md files
let g:vim_markdown_folding_disabled = 1

" Disable syntax conceal
set conceallevel=0

" enable yaml front matter in .md files
let g:vim_markdown_frontmatter = 1

" enable json front matter in .md files
let g:vim_markdown_json_frontmatter = 1

" disable vim_markdown's key mappings
let g:vim_markdown_no_default_key_mappings = 1

" pring `#` in markdown headings in red
autocmd FileType markdown highlight mkdHeading cterm=none ctermfg=9

" print markdown headings in orange
autocmd FileType markdown highlight htmlH1 cterm=none ctermfg=220

" enable file explorer file higlighting only for some files
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
let g:NERDTreeSyntaxEnabledExtensions = ['html', 'css', 'py', 'js', 'ts', 'tsx', 'json', 'xml', 'md', 'csv', 'tsv', 'sql', 'yaml']
let g:NERDTreeSyntaxEnabledExactMatches = ['favicon.ico', 'Makefile', '.git', '.idea']

" higligh full filename rather than just icon
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" let nerdtree's git integration use nerdfonts
let g:NERDTreeGitStatusUseNerdFonts = 1

" allow nerdtree to delete files
let NERDTreeAutoDeleteBuffer = 1

" remove help? message from nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
