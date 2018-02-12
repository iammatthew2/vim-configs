execute pathogen#infect()
filetype plugin indent on

set visualbell
set number relativenumber
syntax on
set ruler
set encoding=utf-8
set wrap
set textwidth=79
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

"How to use:
"leader: not modified: \
"show NERDTree: <leader>e
"file search for text under cursor: <leader>g
"toggle quickfix window: <leader>q
"fuzzy file find with ctrlp: <C-p> and to reduce search scope, add file .ctrlpMarker to top-level scope


" ***************************************************
" Navigation settings: file tree, window splitting
" ***************************************************

" Go back to previous filed edited in buffer
nmap <leader>b :b#<CR>

" Open/close nerdtree
nmap <leader>e :NERDTreeToggle<CR>

" ***************************************************
" Finding/Searching and Quicklist settings
" ***************************************************
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap <leader>h :nohlsearch<CR>

" Git grepping with fugitive
:nnoremap <leader>g :silent execute "Ggrep " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" Quicklist mappings:
:map <C-j> :cn<CR>
:map <C-k> :cp<CR>

:nnoremap <leader>q :call QuickfixToggle()<cr>
let g:quickfix_is_open = 0
function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

" bind K to grep word under cursor

"set noremap K :silent grep! "\b\s?<C-R><C-W>\b"<CR>:cw<CR>:redr!<CR>
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" CtrlP setting:
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"ctrlp setting to set the top level dir that we'll search in. Bypass with ..
let g:ctrlp_root_markers = ['.ctrlpMarker']

" ***************************************************
" Presentation/Style settings
" ***************************************************

" toggle line numbers: regular, relative, relative plus, none
nmap <leader>l :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
nmap <leader>o :set paste!<CR>
nnoremap <leader>x :call NumberToggle()<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Airline
set laststatus=2
