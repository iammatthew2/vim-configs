execute pathogen#infect()
filetype plugin indent on

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Display line numbers on the left
set number

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Turn on syntax highlighting
syntax on

" Show file stats
set ruler

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
" Fugitive settings or general grep settings
" autocmd QuickFixCmdPost *grep* cwindow

" leveraging Fugitive for git grepping, we map to '\g' and silently display it
" to the quickfix windo
:nnoremap <leader>g :silent execute "Ggrep " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" Quicklist mappings:
"navigate quicklist
:map <C-j> :cn<CR>
:map <C-k> :cp<CR>

"toggle quicklist
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

"syntastic base settings. Prob update theese later
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Statusline
" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification
"set statusline=%<\ %n:%f\ %m%r%=%-35.(l:%l-%L,\ c:%c%V%)

"Airline
set laststatus=2
