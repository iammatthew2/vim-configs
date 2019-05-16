execute pathogen#infect()
filetype plugin indent on

set visualbell
set number relativenumber
syntax on
set background=dark
set ruler
set encoding=utf-8
set textwidth=79
set nowrap
set formatoptions-=t
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set backspace=indent,eol,start


" ***************************************************
" How to use this vim configuration:
" ***************************************************
" Leader: not modified: \
" Edit this vimrc: <leader>ev
" File search for text under cursor: <leader>g
" Fuzzy file find with ctrlp: <C-p> and to reduce search scope, add file .ctrlpMarker to top-level scope of project
" File Search :Ggrep someSearchParam
" Go to previous file edited in buffer: <leader>b
" Toggle syntastic errors view: `:lop` and `lcl` to close the location list
" Toggle line numbering styles: <leader>l
" Toggle quickfix window: <leader>q
" Toggle NERDTree: <leader>e

" Commands to master:
"**************************************
" :b fileName  - open file from buffer
" :b# - go to previous open file
" ctrl-z - suspend vim (access the suspended job with 'fg', view jobs with 'jobs' )

" ***************************************************
" How to Plugins:
" ***************************************************
" This vim instance is setup with Pathogen as the plugin manager.
" To add a plugin:
"  $ git submodule add https://github.com/somePackage bundle/somePackageFolderName
"  then go to vim and tell pathogen to pull in the new docs: `:Helptags`
" Plugins are located: ~/.vim/bundle/<pluginname>/

" ***************************************************
" Navigation settings: file tree, window splitting
" ***************************************************
" Edit this config
nmap <leader>ev :vsp $MYVIMRC<CR>

" Go back to previous filed edited in buffer
nmap <leader>b :b#<CR>

" Open/close nerdtree
nmap <leader>e :NERDTreeToggle<CR>

" Open current file in Chome
nmap <leader>c :exec ':!open % -a Google\ Chrome'<CR>

" ***************************************************
" Finding/Searching and Quicklist settings
" ***************************************************
set incsearch
set ignorecase
set smartcase
set hlsearch
" Clear search highlighting
nnoremap <silent> <leader>\ :nohlsearch <cr>

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

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint'] " remember: must `$ eslint --init` in order to setup eslint for a new project

" Airline settings
set laststatus=2
