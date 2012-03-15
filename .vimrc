"-----------------------------------------------------------------------------
" Basics
"-----------------------------------------------------------------------------

let mapleader = ","              " キーマップリーダーを「,」にする
set scrolloff=5                  " スクロール時の余白確保
set textwidth=0                  " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                     " バックアップ取らない
set autoread                     " 他で書き換えられたら自動で読み直す
set noswapfile                   " スワップファイル作らない
set hidden                       " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start   " バックスペースでなんでも消せるように
set formatoptions=lmoq           " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                     " ビープをならさない
set browsedir=buffer             " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
set showcmd                      " コマンドをステータス行に表示
set showmode                     " 現在のモードを表示
set viminfo+=!                   " viminfoファイルの設定
set modelines=0                  " モードラインは無効
set cmdheight=3                  " コマンド入力欄の高さ
set title                        " タイトルを表示
set shortmess+=I                 " スプラッシュを表示しない
set shellslash                   " Winのディレクトリパスの区切りに/を使えるように
set clipboard+=unnamed           " OSのクリップボードを使用する
set clipboard+=unnamed           " ヤンクした文字をOSのクリップボードに入れる
set clipboard+=unnamedplus       " YankRing用の設定
set nrformats-=octal             " 8進数を無効にする
set mouse=a                      " ターミナルでマウスを使用できるようにする

"-----------------------------------------------------------------------------
" Original
"-----------------------------------------------------------------------------

" <C-s>で保存する
noremap <C-S>	:update<CR>
vnoremap <C-S>	<C-C>:update<CR>
inoremap <C-S>	<C-O>:update<CR>

" ;でコマンド入力
noremap ; :
noremap : ;

" jjをEscとして使用する
inoremap jj <Esc>

" <C-i>でヘルプを開く
nnoremap <C-i>  :<C-u>help<Space>
" カーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

" 設定ファイルをコマンドで開く
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>

" 設定ファイルのみを再起動
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>

" htmlファイルの相対URLをgfで開く
autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/

"-----------------------------------------------------------------------------
" StatusLine
"-----------------------------------------------------------------------------

" 常にステータスラインを表示
set laststatus=2

" カーソルが何行目の何列目に置かれているかを表示する
set ruler

" ステータスラインに文字コードと改行文字を表示する
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %t%=[%{GetB()}]\ %l,%c%V%8P

" 挿入モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

function! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endfunction
" help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc

"-----------------------------------------------------------------------------
" Apperance
"-----------------------------------------------------------------------------
set autoindent             " 自動でインデント
set showmatch              " 括弧の対応をハイライト
set number                 " 行番号表示
" set list                 " 不可視文字表示
" set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set display=uhex           " 印字不可能文字を16進数で表示

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" カーソル行をハイライト
set cursorline

" タブページを常に表示
" set showtabline=2
" gVimでもテキストベースのタブページを使う
" set guioptions-=e

" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" コマンド実行中は再描画しない
:set lazyredraw

" 高速ターミナル接続を行う
:set ttyfast

"-----------------------------------------------------------------------------
" Indent
"-----------------------------------------------------------------------------

set autoindent             " 自動でインデント
set smartindent            " 新しい行のインデントを現在行と同じ量に

" :Ptでインデントモード切替
command! Pt :set paste!

" 文字がない場所でのペースト時に空白を詰める
if has('virtualedit') && &virtualedit =~# '\<all\>'
    nnoremap <expr> p (col('.') >= col('$') ? '$' : '') . 'p'
endif

" タブはタブで使う
" set tabstop=8 shiftwidth=8 softtabstop=0

" タブを空白に変換しない
set noexpandtab

"-----------------------------------------------------------------------------
" Complete
"-----------------------------------------------------------------------------

set wildmenu              " コマンド補完を強化
set wildchar=<tab>        " コマンド補完を開始するキー
set wildmode=list:full    " リスト表示，最長マッチ
set history=1000          " コマンド・検索パターンの履歴数
set complete+=k           " 補完に辞書ファイル追加

"-----------------------------------------------------------------------------
" Search
"-----------------------------------------------------------------------------

set wrapscan              " 最後まで検索したら先頭へ戻る
set ignorecase            " 大文字小文字無視
set smartcase             " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch             " インクリメンタルサーチ
set hlsearch              " 検索文字をハイライト

" Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

" 選択した文字列を検索
" カーソル下のキーワード検索は、「*」
" 文章の中にある場合も検索する場合は、「g*」
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" ノーマルモードで「s*」のあと「置換後文字列/g<Cr>」でカーソル下の文字列を置換
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

" 検索結果に移動した時その位置を画面の中央にする
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" 検索時、「/」の入力をエスケープする
" cnoremap  / getcmdtype() == '/' ? '\/' : '/'

"-----------------------------------------------------------------------------
" Move
"-----------------------------------------------------------------------------

" JとDで半ページ移動
nnoremap J <C-D>
nnoremap K <C-U>

nnoremap <C-U> <C-Y>2<C-Y>2<C-Y>2<C-Y>2<C-Y><C-Y>
nnoremap <C-D> <C-E>2<C-E>2<C-E>2<C-E>2<C-E><C-E>

" カーソルを表示行で移動する
" 論理行移動は<C-n>,<C-p>
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
nnoremap <Down> gj
nnoremap <Up>   gk

" 0, 9で行末、行頭へ
nmap 8 0
nmap 9 ^
nmap 0 $

" 挿入モードでのカーソル移動
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

" ノーマルモードでのバッファ移動
nmap <Space> ;bn<CR>
nmap <BS>    ;bp<CR>

" 挿入モードでのバッファ移動
imap <C-Tab>   <ESC>;bn<CR>a
imap <C-S-Tab> <ESC>;bp<CR>a

" F4でバッファを削除する
map <F4> <ESC>;bw<CR>

" フレームサイズを怠惰に変更する
map <kPlus>  <C-W>+
map <kMinus> <C-W>-

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 最後に編集された位置に移動
nnoremap gb '[
nnoremap gp ']

" 対応する括弧に移動
nnoremap [ %
nnoremap ] %

" カーソル位置の単語をyankする
nnoremap vy vawy

" 矩形選択で自由に移動する
set virtualedit+=block

" ビジュアルモード時vで行末まで選択
vnoremap v $h

" <C-hjkl>でウィンドウ移動
nnoremap <C-j> ;<C-w>j
nnoremap <C-k> ;<C-k>j
nnoremap <C-l> ;<C-l>j
nnoremap <C-h> ;<C-h>j

" 括弧までを選択する
vnoremap ( t(
vnoremap ) t)
vnoremap ] t]
vnoremap [ t[
onoremap ( t(
onoremap ) t)
onoremap ] t]
onoremap [ t[

"-----------------------------------------------------------------------------
" Colors
"-----------------------------------------------------------------------------

" ターミナルタイプによるカラー設定
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86" || &term =~ "xterm-256color"
 set t_Co=16
 set t_Sf=^[[3%dm
 set t_Sb=^[[4%dm
elseif &term =~ "xterm-color"
 set t_Co=8
 set t_Sf=^[[3%dm
 set t_Sb=^[[4%dm
endif

" ハイライト on
syntax enable

" 補完候補の色づけ for vim7
hi Pmenu ctermbg=white ctermfg=darkgray
hi PmenuSel ctermbg=blue ctermfg=white
hi PmenuSbar ctermbg=0 ctermfg=9

"-----------------------------------------------------------------------------
" Edit
"-----------------------------------------------------------------------------

" 挿入モードでクリップボードの内容をペースト
imap <C-v>  <ESC>"*pa

" 挿入モードでアンドゥ・リドゥ
imap <C-z>  <ESC>ua
imap <C-a>  <ESC><C-r>a

" 挿入モードで単語単位/行単位の削除をアンドゥ可能にする
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>

" y9で行末までヤンク
nmap y9 y$
" y0で行頭までヤンク
nmap y0 y^

" 括弧の自動カーソル移動
inoremap {}  {}<LEFT>
inoremap []  []<LEFT>
inoremap ()  ()<LEFT>
inoremap ""  ""<LEFT>
inoremap ''  ''<LEFT>

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
" autocmd BufWritePre * :%s/\t/  /ge
"
"-----------------------------------------------------------------------------
" Plugins
"-----------------------------------------------------------------------------

"------------------------------------
" pathogen
"------------------------------------

" pathogenでftdetectなどをloadさせるために一度ファイルタイプ判定をoff
filetype off

" pathogen.vimによってbundle配下のpluginをpathに加える
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt

" ファイルタイプ判定をon
filetype plugin on

"------------------------------------
" VimFiler
"------------------------------------

" $LINUXをコマンドで開く
nnoremap <silent> <Space>vf :<C-U>VimFiler -create $LINUX<CR>

" デフォルトのエクスプローラnetrwをVimFilerに置き換え
" :e {ディレクトリ} で起動
let g:vimfiler_as_default_explorer = 1

" セーフモードで起動しないようにする
let g:vimfiler_safe_mode_by_default=0

"------------------------------------
" restart.vim
"------------------------------------

" :Rsで再起動
let g:restart_command = 'Rs'

" :Rswでセッションありで再起動
command!
\   Rsw
\   let g:restart_sessionoptions = 'blank,curdir,folds,help,localoptions,tabpages'
\   | Restart

"------------------------------------
" jQuery syntax
"------------------------------------

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

"------------------------------------
" Zen-Coding
"------------------------------------

" <C-e>で展開
let g:user_zen_expandabbr_key = '<c-e>'

" 展開するHTMLの言語を設定
let g:user_zen_settings = {'lang' : 'ja'}

"------------------------------------
" YankRing.vim
"------------------------------------

" Yankの履歴参照
nmap ,y ;YRShow<CR>

"------------------------------------
" MiniBufExplorer
"------------------------------------

" set minibfexp
let g:miniBufExplMapWindowNavVim=1 "hjklで移動
let g:miniBufExplSplitBelow=0  " Put new window above
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1
let g:miniBufExplMaxSize = 10

" :TmでMiniBufExplorerの表示トグル
command! Mt :TMiniBufExplorer

"------------------------------------
" NERD_commenter.vim
"------------------------------------

" コメントの間にスペースを空ける
let NERDSpaceDelims = 1

" コメントをトグル
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" 未対応ファイルタイプのエラーメッセージを表示しない
let NERDShutUp = 1

"------------------------------------
" VTreeExplorer
"------------------------------------

" ノーマルモードで起動
nnoremap <silent> <Space>vt :VSTreeExplore<CR>

" 縦に表示する
let g:treeExplVertical = 1

" 分割したウィンドウのサイズ
let g:treeExplWinSize = 30

"------------------------------------
" open-blowser.vim
"------------------------------------

" カーソル下のURLをブラウザで開く
nmap fu <Plug>(openbrowser-open)
vmap fu <Plug>(openbrowser-open)

" カーソル下のキーワードをググる
nnoremap fs :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

"------------------------------------
" textmanip.vim
"------------------------------------

" 選択したテキストの移動
vmap <C-j> <Plug>(Textmanip.move_selection_down)
vmap <C-k> <Plug>(Textmanip.move_selection_up)
vmap <C-h> <Plug>(Textmanip.move_selection_left)
vmap <C-l> <Plug>(Textmanip.move_selection_right)

" 行の複製(<M>はAlt)
vmap <M-d> <Plug>(Textmanip.duplicate_selection_v)
nmap <M-d> <Plug>(Textmanip.duplicate_selection_n)

"------------------------------------
" surround.vim
"------------------------------------

" s, ssで選択範囲を指定文字でくくる
" nmap s <Plug>Ysurround
" nmap <Plug>Yssurround

"------------------------------------
" smooth_scroll.vim
"------------------------------------

" <PageDown>と<PageUp>でスムーズスクロールする
" nnoremap <PageDown> :<C-u>call SmoothScroll("d",1,1)<CR>
" nnoremap <PageDown> <c-f>
" nnoremap <PageUp><C-B>

"------------------------------------
" unite.vim
"------------------------------------

" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" ブックマーク一覧
nnoremap <silent> ,uc :<C-u>Unite bookmark<CR>

"------------------------------------
" git.vim
"------------------------------------

let g:git_no_map_default = 1
let g:git_command_edit = 'rightbelow vnew'
nnoremap <Space>gd :<C-u>GitDiff --cached<Enter>
nnoremap <Space>gD :<C-u>GitDiff<Enter>
nnoremap <Space>gs :<C-u>GitStatus<Enter>
nnoremap <Space>gl :<C-u>GitLog<Enter>
nnoremap <Space>gL :<C-u>GitLog -u \| head -10000<Enter>
nnoremap <Space>ga :<C-u>GitAdd<Enter>
nnoremap <Space>gA :<C-u>GitAdd <cfile><Enter>
nnoremap <Space>gc :<C-u>GitCommit<Enter>
nnoremap <Space>gC :<C-u>GitCommit --amend<Enter>
nnoremap <Space>gp :<C-u>Git push

"------------------------------------
" vimshell
"------------------------------------

" ノーマルモードで起動
nnoremap <silent> vs :VimShell<CR>

" シェルコマンドのパスを通す
let $PATH = $VIM.'\bin'.';'.$PATH

" vimshell setting
let g:vimshell_interactive_update_time = 10
let g:vimshell_prompt = '$ '
" let g:vimshell_user_prompt = '"[" .date(). "](" . getcwd() . ") --- (" . $USER . "@" . hostname() . ")"'
let g:vimshell_right_prompt = 'vimshell#vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
let g:vimshell_enable_smart_case = 1

if has('win32') || has('win64')
  " Display user name on Windows.
  " let g:vimshell_prompt = $USERNAME."% "
else
  " Display user name on Linux.
  " let g:vimshell_prompt = $USER."% "
  let g:vimshell_execute_file_list['zip'] = 'zipinfo'

  call vimshell#set_execute_file('bmp,jpg,png,gif', 'gexe eog')
  call vimshell#set_execute_file('mp3,m4a,ogg', 'gexe amarok')
  call vimshell#set_execute_file('tgz,gz', 'gzcat')
  call vimshell#set_execute_file('tbz,bz2', 'bzcat')
endif

"------------------------------------
" neocomplcache
"------------------------------------

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" esでスニペット編集できるようにする
noremap es :<C-u>NeoComplCacheEditSnippets<CR>
