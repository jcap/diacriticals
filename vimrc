"rjbs was a big help...

" This must be first, because it changes other options as side effect
set nocompatible

set autoindent            " always set autoindenting on
set backspace=2           " allow backspace beyond insertion point
set background=dark       " console bg is dark
set clipboard+=unnamed    " put yanks/etc on the clipboard
set copyindent            " copy the previous indentation on autoindenting
set directory-=.          " don't use cwd for tmp files
set encoding=utf-8        " unicode
set expandtab             " spaces not tabs
set foldlevelstart=99     " start with all folds open
set foldopen-=search      " don't open folds when you search into them
set foldopen-=undo        " don't open folds when you undo stuff
set formatoptions=tcqr2l  " t - autowrap normal text
                          " c - autowrap comments and re-insert comment leader
                          " q - allow gq to reformat comments
                          " r - re-insert comment leader on newline
                          " 2 - indent based on second line of para, not first
                          " l - don't break long lines that were long before ins
set guioptions+=f         " don't fork
set guioptions-=T         " don't show toolbar
set hidden
set history=1000          " remember more commands and search history
set hlsearch              " highlight search terms
set incsearch             " show search matches as you type
set laststatus=2          " always
set number                " always show line numbers
set path=.,$HOME,,
set ruler                 " display cursor position
set shiftwidth=2          " number of spaces to use for autoindenting
set showmatch             " set show matching parenthesis
set softtabstop=2
set smartcase             " ignore case if search pattern is all lowercase,
                          " case-sensitive otherwise
set showcmd
set shortmess=at          " shortens messages to avoid 'press a key' prompt
set tabstop=2
set timeout               " allow keys to timeout
set title                 " change the terminal's title
set textwidth=80          " set normal border; can unset for coding
set wildignore+=*/CVS/
set wildmenu              " enable menu of completions
set wildmode=longest:full,full " complete only as much as is common,
                               " then show menu

filetype off
execute pathogen#infect()

syntax on
colorscheme solarized
filetype plugin on

set tenc=utf-8


" highlight tabs and trailing spaces
" set listchars=trail:.,extends:#,nbsp:.
set listchars=tab:>-,trail:-
set list

" change the mapleader from \ to ,
let mapleader=","

"let mapleader="\<Space>"
nmap <leader>u :silent GundoToggle<CR>

map <C-n> :NERDTreeToggle<CR>

""  set various script options
"let perl_fold=1                        " allow perl folding

" map <C-x> ggVGg?

if has("gui_running")
  if has("macunix")
      colorscheme solarized
      set guifont=Monaco:h12
  endif
endif

command -range=% HTMLtidy execute "<line1>,<line2>!tidy -config ~/.tidyrc -q"

function ModifiedFlag()
  if (&modified)
    return "*"
  else
    return " "
  endif
endfunc

set statusline=[%n]\ %{ModifiedFlag()}%f\ %=%h%r%w\ (%v,%l)\ %P\

""" Airline Configuration
if !exists('g:airline_symbols')
  let g:airline_symbols = {}

  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.whitespace = 'Ξ'
  let g:airline_powerline_fonts=0

  let g:airline_theme="murmur"
endif

let &colorcolumn=join(range(121,999),",")

au BufNewFile,BufRead Gantryfile set filetype=make

