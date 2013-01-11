"helptags ~/.vim/doc
""easy motion \\w
""matchit %
""shft-K man pages in python too
"" ys add    (till) can be s //yss"    surround
"" cs change			be t //cst"
"" ds delete			be iw // ys3iw
"nerdcomment
"" \cc -> comment
"" \cu -> uncomment
"" \c$  -> end of line
"" \cA -> append after line

set nu
set mouse=a
set cursorline  
set nocp
filetype plugin on
set undolevels=1000
set showmatch
set showmode
set autoindent
set smartindent
set ts=4
set sw=4
filetype indent on 
syntax enable
set background=dark
set showfulltag
set autoread
set ignorecase
"highlight search
set hlsearch
set spell
" can be made manual
set foldmethod=syntax
set foldlevel=20
set ttyfast

nnoremap j gj
nnoremap k gk
"nnoremap <Down> gj
"nnoremap <Up> gk
nnoremap 0 g0
nnoremap $ g$
" also in visual mode
vnoremap j gj
vnoremap k gk
"vnoremap <Down> gj
"vnoremap <Up> gk
vnoremap 0 g0
vnoremap $ g$

" set Term color to 256 (supports)
set t_Co=256 
" if solarized is enabled
let g:solarized_termcolors=256
colorscheme molokai

autocmd Filetype python set foldmethod=indent

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#CompleteCpp


if has('win32')
	colorscheme desert
	set bs=2
	let g:notes_directory = './Dropbox/epistle/'
	let g:vlh_repository_dir = "./.localhistory/" 
	set tags+=./vimfiles/tags/cpp
    let g:pydiction_location = "./vimfiles/pydiction-1.2/complete-dict"
    autocmd FileType python set complete+=k./vimfiles/pydiction-1.2/complete-dict isk+=.,( 
else
	let g:notes_directory = './Dropbox/epistle/'
	let g:vlh_repository_dir = "/home/xadmin/.localhistory/" 
	set tags+=~/.vim/tags/cpp
    let g:pydiction_location = "$HOME/.vim/pydiction-1.2/complete-dict"
	autocmd FileType python set complete+=k$HOME/.vim/pydiction-1.2/complete-dict isk+=.,( 
endif


function! s:Mru_Window_Toggle()
    let wnum = bufwinnr('__MRU_Files__')
    MRU
    if wnum != -1
close
    endif
endfunction



" notes
let g:notes_suffix = '.txt'
let g:notes_title_sync = 'change_title'
" NerdTree
let NERDTreeShowBookmarks=1
" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_balloons = 1
let g:syntastic_loc_list_height=2
" Tagbar
let g:tagbar_width = 30

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"map <F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

" custom Abbreviations
ab cdc cd %:p:h <CR>
ab ff !firefox %:p
autocmd FileType java map <silent><F9> :!javac %<cr>
autocmd FileType java map <silent><C-F9> :!java %:t:r<cr>
autocmd FileType java map <silent><F8> :!javac -Xlint:unchecked %<cr>
autocmd FileType java map <silent><C-F8> :!java %:t:r 
" File insert
map <leader>ff :r !echo ~/
" reg view
map <leader>] :reg<CR>
" Change Directory
nnoremap <leader>cdc :cd %:p:h<CR>:pwd<CR>
inoremap <C-space> <C-x><C-o>
" Zencoding
let g:user_zen_expandabbr_key = '<C-y>' 

map <leader>nn :call NextColor(1)<CR>
map <leader>nb :call NextColor(-1)<CR>

noremap <F12> :SyntasticToggleMode <CR>
autocmd FileType python map <silent><F9> :!python %<cr>
nnoremap <C-F8> :call NextColor(1)<CR>
nnoremap <S-F8> :call NextColor(-1)<CR>
noremap <silent><F8> :call C_Run()<cr> 
noremap <silent><F7> :IRun<cr>
noremap <silent><C-F6> :YRShow<CR>
noremap <silent><F6> :NERDTreeToggle<cr>
noremap <silent><C-F5> :TlistToggle<cr>
noremap <silent><F5> :TagbarToggle<CR>
noremap <silent><C-F4> :TaskList<cr>
noremap <silent><F4> :TaskList<CR> :NERDTree %:p:h<CR> :TagbarOpen<CR> 
noremap <silent><C-F3> :GundoToggle<CR> 
noremap <silent><F3> :call <SID>Mru_Window_Toggle()<CR>
noremap <silent><C-F2> :SearchNotes 
noremap <silent><F2> :RecentNotes <CR>
noremap <silent><C-F1> :split note:
noremap <silent><F1> :Note  

nmap <silent> <A-Up> :wincmd K<CR>
nmap <silent> <A-Down> :wincmd J<CR>
nmap <silent> <A-Left> :wincmd H<CR>
nmap <silent> <A-Right> :wincmd L<CR>

"let g:pyflakes_use_quickfix = 0
