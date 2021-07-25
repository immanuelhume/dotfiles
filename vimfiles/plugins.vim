call plug#begin('~/.vim/plugged')

" Gruvbox theme
Plug 'morhetz/gruvbox'

" Golang plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Ale
let g:ale_completion_enabled = 1
Plug 'dense-analysis/ale'

call plug#end()
