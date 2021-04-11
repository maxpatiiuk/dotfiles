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

" INSTALL PLUGINS
call plug#begin('~/.vim/plugged')

" start screen
Plug 'mhinz/vim-startify'

" theme
Plug 'crusoexia/vim-monokai'

" javascript syntax
Plug 'pangloss/vim-javascript'

" markdown syntax
Plug 'tpope/vim-markdown'

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

" provide syntax for the following languages in markdown
let g:markdown_fenced_languages = ['python', 'js', 'json', 'html', 'bash']

" look ahead 200 chars when syntax highligting
let g:markdown_minlines = 200

" enable file explorer file higlighting only for some files
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
let g:NERDTreeSyntaxEnabledExtensions = ['html', 'css', 'py', 'js', 'ts', 'tsx', 'json', 'xml', 'md', 'csv', 'tsv', 'sql']
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



" OLD CONFIG THAD DID SOME MAGIG)
" set runtimepath+=~/.vim_runtime

" source ~/.vim_runtime/vimrcs/basic.vim
" source ~/.vim_runtime/vimrcs/filetypes.vim
" source ~/.vim_runtime/vimrcs/plugins_config.vim
" source ~/.vim_runtime/vimrcs/extended.vim

" try
" source ~/.vim_runtime/my_configs.vim
" catch
" endtry
