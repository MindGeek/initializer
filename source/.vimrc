""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Section for vim plug: https://github.com/junegunn/vim-plug
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'bfrg/vim-cpp-modern'
Plug 'kabbamine/yowish.vim'
Plug 'szw/vim-tags'
Plug 'junegunn/fzf.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set expandtab
set tabstop=4
set shiftwidth=4


syntax on
colorscheme yowish
set number

set fileencodings=utf-8,gb18030
set encoding=utf-8
"set termencoding=utf-8
set termencoding=gb18030
set fileformats=unix
"set encoding=prc

set backup " make backup file and leave it around 
set backupdir=~/.vimbackup " where to put backup file 

set mouse=a

" highlight line
"set cursorline
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=white guifg=white

" highlight column
"set cursorcolumn
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=white guifg=white

" Enable fzf in vim
set rtp+=~/projects/github/pkg/fzf



" Learning and practice vimscript.
" echo '>^.^< Learning vimscript..'

" Customized vimscripts.
" https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
noremap <c-f> :Files<enter>
noremap <c-g> :Tags<enter>

" Map K to tag jump.
noremap K <c-]>

" Search tags in current dir or above.
set tags=./tags;/

