
packadd vimball
" always autosave everything 
" with ignore warnings
:au FocusLost * silent! wa
set autoindent
set history=50
set autowrite         " Automatically write a file when leaving a modifer buffer
set autowriteall
set ruler
set nocompatible
set showcmd
set mouse=a           " Automatically enable mouse usage
set mousehide         " Hide the mouse cursor while typing
set history=1000      " Store a ton of history (default is 20)
set showmode
set showmatch
" set backup            
set hlsearch
set incsearch
set nu
set relativenumber
set numberwidth=3
set tabstop=2
set expandtab
set shiftwidth=2
set showcmd
set cursorline          " Highlight current line
set background=dark
set foldenable          " Auto fold code
set nowrap
set list
set ignorecase          " Case insensitive search
set splitbelow
set splitright
set listchars=tab:>·,trail:·,extends:>,precedes:<  " Highlight problematic whitespace
set autochdir " current file dirrectory when create any file

autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
let g:vim_vue_plugin_load_full_syntax = 1
let g:vim_vue_plugin_debug = 1

if has('persistent_undo')
  set undofile          " So is persistent undo
  set undolevels=1000   " Maximum number of changes
  set undoreload=10000  " Maximum number lines to save for undo on a buffer reload
endif

" folding
" set foldmethod=syntax

set colorcolumn=+1        " highlight column after 'textwidth'
set colorcolumn=+1,+2,+3  " highlight three columns after 'textwidth'
set colorcolumn=80
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey


inoremap eu <esc>

syntax on
filetype plugin indent on
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" hide the cursorline for inactive windows
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" highlight status active window
highlight StatusLineNC cterm=bold ctermfg=white ctermbg=0
highlight LineNr ctermfg=8 ctermbg=0
highlight FoldColumn ctermbg=0

syntax enable


" simplify switch between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>

" set vertical wrapper
hi OverLength ctermbg=none cterm=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
  echo "Long lines highlighted"
 else
  call matchdelete(w:longlinehl)
  unl w:longlinehl
  echo "Long lines unhighlighted"
 endif
endfunction


" maps
" :map 
map <C-n> :NERDTreeToggle<CR>

" Plugins will be downloaded under the specified directory
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'posva/vim-vue'
Plug 'digitaltoad/vim-pug'
Plug 'mattn/emmet-vim'


" List ends here. Plugins become visibe to Vim after this call
call plug#end()

" move current file to another path
function! MoveFile(newspec)
     let old = expand('%')
     " could be improved:
     if (old == a:newspec)
         return 0
     endif
     exe 'sav' fnameescape(a:newspec)
     call delete(old)
endfunction

command! -nargs=1 -complete=file -bar MF call MoveFile('<args>')


