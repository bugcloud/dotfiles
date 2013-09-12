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
NeoBundle 'git://github.com/Shougo/neosnippet.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/kchmck/vim-coffee-script.git'
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'git://github.com/Lokaltog/vim-easymotion.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/tpope/vim-rails.git'
NeoBundle 'git://github.com/tpope/vim-cucumber.git'
NeoBundle 'git://github.com/tpope/vim-haml.git'
NeoBundle 'git://github.com/tpope/vim-rake.git'
NeoBundle 'git://github.com/tpope/vim-endwise.git'
NeoBundle 'git://github.com/scrooloose/syntastic.git'
NeoBundle 'git://github.com/ujihisa/neco-ruby.git'
NeoBundle 'git://github.com/koron/nyancat-vim.git'
NeoBundle 'git://github.com/Sixeight/unite-grep.git'
NeoBundle 'git://github.com/thinca/vim-qfreplace.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'git://github.com/taka84u9/vim-ref-ri.git'
NeoBundle 'git://github.com/mattn/hahhah-vim.git'
NeoBundle 'git://github.com/mattn/webapi-vim.git'
NeoBundle 'git://github.com/mattn/gal-vim.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/othree/html5.vim.git'
NeoBundle 'git://github.com/kien/rainbow_parentheses.vim.git'
NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'
NeoBundle 'git://github.com/vim-scripts/toggle_mouse.git'
NeoBundle 'git://github.com/tomtom/tcomment_vim.git'
NeoBundle 'git://github.com/kana/vim-textobj-user.git'
NeoBundle 'git://github.com/rhysd/vim-textobj-ruby.git'
NeoBundle 'git://github.com/rhysd/unite-ruby-require.vim.git'
NeoBundle 'git://github.com/rhysd/neco-ruby-keyword-args.git'
NeoBundle 'git://github.com/rking/ag.vim.git'
NeoBundle 'git://github.com/yuratomo/w3m.vim.git'

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
set incsearch
set ignorecase
set smartcase
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
set clipboard+=unnamed
" コマンドモードの補完で大文字小文字を無視
set wildignorecase
set wildmode=list:full
autocmd BufWritePre * call RTrim()

"Global Key binds
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>
" Visualモード時のヤンクをクリップボードにも入れる
vmap ,y "+y
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

" neosnippet
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.bundle/snipmate-snippets/snippets'

" Plugin key-mappings.
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
imap <C-U> <Esc>:Unite snippet<CR>
inoremap <expr><C-g>  neocomplcache#undo_completion()
inoremap <expr><C-l>  neocomplcache#complete_common_string()
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
au FileType snippet nmap <buffer><Space>e :e #<CR>
" snippetの編集
nmap <Space>e :<C-U>NeoComplCacheEditSnippets<CR>
au BufRead,BufNewFile *.snip  set filetype=snippet

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

""" Unite.vim
" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1
" unite-grepのバックエンドをagに
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200


" インサート／ノーマルどちらからでも呼び出せるようにキーマップ
nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"nnoremap <silent> <C-b> :<C-u>Unite buffer file_mru<CR>
"inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer file_mru<CR>
"nnoremap <silent> <C-a> :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"inoremap <silent> <C-a> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

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

""" Using rbenv Ruby in Unite
let g:unite_source_ruby_require_ruby_command = '$HOME/.rbenv/shims/ruby'

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

"insert comment to end tag
function! Endtagcomment()
    let reg_save = @@

    try
        silent normal vaty
      catch
        execute "normal \<Esc>"
        echohl ErrorMsg
        echo 'no match html tags'
        echohl None
        return
    endtry

    let html = @@

    let start_tag = matchstr(html, '\v(\<.{-}\>)')
    let tag_name  = matchstr(start_tag, '\v([a-zA-Z]+)')

    let id = ''
    let id_match = matchlist(start_tag, '\vid\=["'']([^"'']+)["'']')
    if exists('id_match[1]')
        let id = '#' . id_match[1]
    endif

    let class = ''
    let class_match = matchlist(start_tag, '\vclass\=["'']([^"'']+)["'']')
    if exists('class_match[1]')
        let class = '.' . join(split(class_match[1], '\v\s+'), '.')
    endif

    execute "normal `]va<\<Esc>`<"

    let comment = g:endtagcommentFormat
    let comment = substitute(comment, '%id', id, 'g')
    let comment = substitute(comment, '%class', class, 'g')
    let @@ = comment

    normal ""P

    let @@ = reg_save
endfunction

let g:endtagcommentFormat = '<!-- /%id%class -->'
nnoremap ,t :<C-u>call Endtagcomment()<CR>

" ref.vim
let g:ref_open = 'vsplit'
let g:ref_refe_cmd = "rurema"
let g:ref_refe_version = 2

" zencoding
let g:user_zen_settings = {
  \  'lang' : 'ja',
  \  'html' : {
  \    'filters' : 'html'
  \  },
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'html,c',
  \  },
  \  'css' : {
  \    'filters' : 'fc',
  \  },
  \  'javascript' : {
  \    'snippets' : {
  \      'jq' : "\\$(function() {\n\t${cursor}${child}\n});",
  \      'jq:each' : "\\$.each(arr, function(index, item)\n\t\\${child}\n});",
  \      'fn' : "(function() {\n\t${cursor}\n})();",
  \      'tm' : "setTimeout(function() {\n\t${cursor}\n}, 100);",
  \      'int' : "setInterval(function() {\n\t${cursor}\n}, 100);",
  \    },
  \  },
  \  'coffee' : {
  \    'snippets' : {
  \      'jq' : "\\$ ->\n\t${cursor}${child}",
  \      'jq:each' : "\\$.each arr, (index, item) ->\n\t${child}",
  \      'fn' : "() ->\n\t${cursor}",
  \      'tm' : "setTimeout () ->\n\t${cursor}\n, 100",
  \      'int' : "setInterval () ->\n\t${cursor}\n, 100",
  \    },
  \  },
  \  'haml' : {
  \    'filters' : 'html'
  \  },
  \  'erb' : {
  \    'filters' : 'html'
  \  },
  \}

nnoremap ,rr :<C-U>Ref refe<Space>
