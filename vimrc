execute pathogen#infect()
filetype plugin indent on
syntax on

" enable the mouse for cursor navigation
set mouse=a

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
map <down> <nop>
map <left> <nop>
map <right> <nop>

" alias j and k to jump wrapped lines
nnoremap j gj
nnoremap k gk

" alias jj to ESCAPE for command palette
imap jj <ESC>

" stop <ESC> from moving cursor one character to the left
nnoremap i a

