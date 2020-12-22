" Set 'nocompatible' because it's vim, not vi, and we want to add things if we
" try to be vi or distro compatible
set nocompatible

" Enable syntax highlighting if available and not overridden
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" allow backspacing over everything in insert mode
set bs=indent,eol,start

" always set autoindenting on
set autoindent

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Better command-line completion
set wildmenu

" Completion from include files disabled
set complete-=i

" When on, a <Tab> in front of a line inserts blanks according to
" 'shiftwidth'.
set smarttab

" What happens when you press <TAB> or <BS>
set softtabstop=4

" Number of spaces for shifting lines or (auto)indent
set shiftwidth=4

" Use spaces instead of tab
set expandtab

" Start searching immediately
set incsearch

" Highlight the searches
set hlsearch

" Enable indentation rules by filetype
if has('autocmd')
  filetype plugin indent on
endif

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Avoid using the mouse to stop indent breaking pastes by toggling manually
" Also show the changes in normal mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Change the default characters when using ":set list" for visibility
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Keep the cursor from the edge so you have context while editing
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

" Display as much of the last line as possible
set display+=lastline

" Fish breaks vim before patch 276 in version 704, so use bash
if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/bin/bash
endif

" Don't remember global options changes in a session. vimrc, plugins can
" change between uses of a session and be affected.
set sessionoptions-=options

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
