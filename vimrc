call pathogen#infect()
filetype plugin indent on
syntax on

" set leader to space
let mapleader=' '
set autoindent
set smartindent
set nostartofline
syntax enable
set noswapfile
set gdefault
set incsearch
set ignorecase
set smartcase
set encoding=utf-8
set laststatus=2
set splitbelow
set splitright
set wildmenu
set wildmode=longest:full,full

" UltiSnips snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsListSnippets="<tab><tab>"
let g:UltiSnipsEditSplit="vertical"

" python tabs
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" detect python django filetype
autocmd FileType python set ft=python.django

" a better htmldjango detection
augroup filetypedetectHTML
  " removes current htmldjango detection located at $VIMRUNTIME/filetype.vim
  au! BufNewFile,BufRead *.html
  au  BufNewFile,BufRead *.html   call FThtml()

  func! FThtml()
    let n = 1
    while n < 10 && n < line("$")
      if getline(n) =~ '\<DTD\s\+XHTML\s'
        setf xhtml
        return
      endif
      if getline(n) =~ '{%\|{{\|{#'
        setf htmldjango.html
        return
      endif
      let n = n + 1
    endwhile
    setf html
  endfunc
augroup END

" copy to system clipboard from visual
vnoremap y "+y
nnoremap y "+y
vnoremap p "+p
nnoremap p "+p

" use ag over ack
if executable('ag')
  " Use ag over ack
  let g:ackprg='ag --nogroup --nocolor --column'

  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" wildignore
set wildignore+=*.pyc,*~
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj
set wildignore+=*/node_modules/*,*/.hg/*,*/.git/*

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
nnoremap <leader>nt :NERDTreeToggle<CR>
nmap nt :NERDTreeToggle<CR>

" Open Ag search
nnoremap <leader>a :Ack 

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

