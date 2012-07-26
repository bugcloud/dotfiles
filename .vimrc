set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.bundle/neobundle.vim
  call neobundle#rc(expand('~/.bundle'))
endif

NeoBundle 'Rename'
NeoBundle 'git://github.com/vim-ruby/vim-ruby.git'
NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neocomplcache-snippets-complete.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/kchmck/vim-coffee-script.git'
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/tpope/vim-rails.git'
NeoBundle 'git://github.com/tpope/vim-cucumber.git'
NeoBundle 'git://github.com/tpope/vim-haml.git'
NeoBundle 'git://github.com/tpope/vim-rake.git'
NeoBundle 'git://github.com/motemen/git-vim.git'
NeoBundle 'git://github.com/Lokaltog/vim-easymotion.git'
NeoBundle 'git://github.com/scrooloose/syntastic.git'
NeoBundle 'git://github.com/mattn/hahhah-vim.git'
NeoBundle 'git://github.com/ujihisa/neco-ruby.git'
NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'
NeoBundle 'git://github.com/koron/nyancat-vim.git'
NeoBundle 'git://github.com/Sixeight/unite-grep.git'
NeoBundle 'git://github.com/thinca/vim-qfreplace.git'
NeoBundle 'git://github.com/mattn/webapi-vim.git'
NeoBundle 'git://github.com/mattn/gal-vim.git'

filetype plugin on
filetype indent on
syntax enable
if has('gui_running')
  set background=light
else
  set background=dark
endif
set t_Co=16
let g:solarized_termcolors=16
let g:solarized_termtrans=1
colorscheme solarized
set hlsearch
set smartindent
set number
set mouse=a
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set list
set listchars=tab:>-
set nocompatible
set laststatus=2
set encoding=utf-8
set clipboard=unnamed
autocmd BufWritePre * call RTrim()

"Global Key binds
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>
" switch window
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

"Powerline
let g:Powerline_symbols = 'fancy'

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_auto_select = 1

" Plugin key-mappings.
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>  neocomplcache#undo_completion()
inoremap <expr><C-l>  neocomplcache#complete_common_string()
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType php set tabstop=4 softtabstop=4 shiftwidth=4
"autocmd FileType php set noexpandtab
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"vim-ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
"rails.vim
let g:rails_level=4
let g:rails_default_file="app/controllers/application.rb"
let g:rails_default_database="sqlite3"

"git
set statusline=%{GitBranch()}

nmap ,l :call PHPLint()<CR>
imap <Nul> <C-x><C-o>
let g:treeExplVertical=1
let g:treeExplWinSize=30
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>
autocmd FileType php :map! =function <CR><LEFT><LEFT><DEL><DEL>function  {<CR>}<CR><UP><UP><RIGHT><RIGHT><RIGHT><RIGHT>
autocmd FileType php :map! =var <CR><LEFT><LEFT><DEL><DEL>var <CR><UP>
autocmd FileType php :map! =php <?php  ?><LEFT><LEFT><LEFT>
autocmd FileType php inoremap <S-a><S-r> ->
autocmd FileType php inoremap <S-a><S-a><S-r> =>

"""VimShell
" ,is: シェルを起動
nnoremap <silent> ,is :VimShell<CR>
" ,irb: irbを非同期で起動
nnoremap <silent> ,irb :VimShellInteractive irb<CR>
" ,ss: 非同期で開いたインタプリタに現在の行を評価させる
nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>
vmap <silent> ,ss :VimShellSendString<CR>

""" Unite.vim
" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1

" インサート／ノーマルどちらからでも呼び出せるようにキーマップ
nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-b> :<C-u>Unite buffer file_mru<CR>
inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer file_mru<CR>
nnoremap <silent> <C-a> :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
inoremap <silent> <C-a> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" grep
let g:unite_source_grep_default_opts = '-iRHn'
nnoremap <silent> ,ug :Unite grep:./:%<CR>

" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction

function InsertTabWrapper()
  if pumvisible()
    return "\<c-n>"
  endif
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k\|<\|/'
    return "\<tab>"
  elseif exists('&omnifunc') && &omnifunc == ''
    return "\<c-n>"
  else
    return "\<c-x>\<c-o>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

function PHPLint()
  let result = system( &ft . ' -l ' . bufname(""))
  echo result
endfunction

function! RTrim()
  let s:cursor = getpos(".")
  %s/\s\+$//e
  call setpos(".", s:cursor)
endfunction

" For Mac OS
" ,y : レジスタに入ってるテキストをクリップボードに保存
let s:is_mac = (has('mac') || has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin')
if s:is_mac
  nmap ,y :call system("pbcopy", @")<CR>
endif
