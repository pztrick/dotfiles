call pathogen#infect()
filetype plugin indent on
syntax on

let mapleader=','

" wildignore
set wildignore=*.pyc,*~

" enable the mouse for cursor navigation
set mouse=a

" automatically open nerdtree
" autocmd vimenter * NERDTree

" open nerdtree if no file is opened on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if the only pane open is the NERDtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Toggle nerd with leader nt
cmap nt NERDTreeToggle<CR>

" Window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
cmap wh wincmd h<CR>
cmap wj wincmd j<CR>
cmap wk wincmd k<CR>
cmap wl wincmd l<CR>

" automatically toggle (no)paste indents when pasting from clipboard
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" start in INSERT mode
" start

" column highlighting
set cursorline
set colorcolumn=72

" solarized
set background=dark " light | dark "
let g:solarized_termcolors=256
let g:solarized_termtrans=1 " this will use terminal background color instead
set t_Co=256
colorscheme solarized

" shame tab characters visually
" set list
" set listchars=tab:>.,trail:.,extends:#,nbsp:.

" don't shame tab characters in HTML
autocmd filetype html,xml set listchars-=tab:>.

" map ; to :
nnoremap ; :

" disable arrow keys (force use of hjkl)
map <up> <nop>
imap <up> <nop>
map <down> <nop>
imap <down> <nop>
map <left> <nop>
imap <left> <nop>
map <right> <nop>
imap <right> <nop>

" alias j and k to jump wrapped lines
nnoremap j gj
nnoremap k gk

" alias jj to ESCAPE for command palette
imap jj <C-c>
inoremap <ESC> <nop>

" 

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Map jj to canceling command T prompt -- not working
let g:CommandTCancelMap=['<Esc>', '<C-c>', 'jj']

