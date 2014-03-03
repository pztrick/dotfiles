execute pathogen#infect()
filetype plugin indent on
syntax on

let mapleader=','

" wildignore
set wildignore=*.pyc,*~

" enable the mouse for cursor navigation
set mouse=a

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
se t_Co=16
colorscheme solarized

" shame tab characters visually
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

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

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Map jj to canceling command T prompt -- not working
let g:CommandTCancelMap=['<Esc>', '<C-c>', 'jj']

