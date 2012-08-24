"---------------------------------------------------------------------------
" konitter's .vimrc
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
" Initialize "{{{
"

" Vi互換をオフ
set nocompatible

" for Win
let s:is_windows = has('win32') || has('win64')

" キーマップリーダーを「,」にする
let mapleader = ","

" Win用の設定を読み込む
if s:is_windows && filereadable($VIM.'/vimrc_local.vim')
  source $VIM/vimrc_local.vim
endif

" 各種コマンドのパスを通す
let $PATH = $PATH.';C:\MinGW\bin;C:\MinGW\msys\1.0\bin'

"------------------------------------
" neobundle.vim "{{{
"

filetype off

if has('vim_starting')
  set runtimepath+=$VIM/vimfiles/neobundle/neobundle.vim/
endif

call neobundle#rc($VIM.'/vimfiles/neobundle/')

" from GitHub
NeoBundle 'anyakichi/vim-surround'
NeoBundle 'Shougo/git-vim.git'
NeoBundle 'Shougo/neocomplcache.git',
NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vimfiler.git',
      \ { 'depends' : 'Shougo/unite.vim.git' }
NeoBundle 'Shougo/vimproc.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'kana/vim-operator-user'
NeoBundleLazy 'hail2u/vim-css3-syntax.git'
NeoBundleLazy 'tyru/open-browser.vim.git'
NeoBundle 'tyru/restart.vim.git'
NeoBundle 'fholgado/minibufexpl.vim.git'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 't9md/vim-textmanip'
NeoBundle 'othree/eregex.vim'
NeoBundle 'banyan/recognize_charcode.vim.git'
NeoBundle 'othree/html5.vim.git'
NeoBundle 'pangloss/vim-javascript.git'
NeoBundle 'teramako/jscomplete-vim.git'
NeoBundle 'vim-scripts/mru.vim.git'
NeoBundle 'vim-scripts/YankRing.vim.git'
NeoBundle 'vim-scripts/JavaScript-syntax.git'
NeoBundle 'vim-scripts/jQuery.git'
NeoBundle 'vim-scripts/IndentAnything.git'

filetype plugin indent on

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif

"---------------------------------------------------------------------------
" View "{{{
"

" ターミナルでマウスを使用できるようにする
set mouse=a

" 行番号を表示する
set number

" 不可視文字の表示
" set list
" 不可視文字の表示形式
" set listchars=tab:\|\

" ウィンドウ幅より長い行を折り返す
set wrap
" カーソルが行頭/末にある時に前/次行に移動できるように
set whichwrap=b,s,h,l,<,>,[,]

" タイトルを表示
set title

" スプラッシュ画面を表示しない
set shortmess+=I

" 最終行に現在のモードを表示
set showmode

" スクロール時の余白確保
set scrolloff=5

" バッファで開いているディレクトリをExploreの初期ディレクトリに
set browsedir=buffer

" バックアップを作らない
set nobackup
set nowritebackup

" スワップファイルを作らない
set noswapfile

" 8進数を無効にする
set nrformats-=octal
" 印字不可能文字を16進数で表示
set display=uhex

" ビープ音を鳴らさない
set visualbell
set vb t_vb=

" コマンド・ファイル名補完の拡張機能を使用
set wildmenu
" 補完を開始するキー
set wildchar=<tab>
" リスト表示，最長マッチ
set wildmode=list:longest,full

" コマンド・検索パターンの履歴数
set history=1000

" 補完に辞書ファイル追加
set complete+=k

" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" カーソル行をハイライト
set cursorline
" 縦方向もハイライト
" set cursorcolumn

" コマンド実行中に画面を描画しない
set lazyredraw

" コマンド入力欄の高さを3行分に設定
set cmdheight=3

" 常にステータスラインを表示
set laststatus=2
" コマンドをステータスラインに表示
set showcmd
" ステータスラインに文字コードと改行文字を表示する
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %t%=%l,%c%V%8P

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" タブページを常に表示
" set showtabline=2

"---------------------------------------------------------------------------
" Edit "{{{
"

" タブ幅設定
" set tabstop=8 shiftwidth=8 softtabstop=0
" タブを空白に変換しない
set noexpandtab

" .jsのみタブ幅とタブを空白にする設定
au BufNewFile,BufRead *.js set expandtab tabstop=8 shiftwidth=4
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" ファイルごとの設定を有効にする
set modeline
set modelines=2

" OSのクリップボードを使用する
set clipboard+=unnamed

" 自動で折り返しをしない
set textwidth=0

" バックスペースで何でも消せるように
set backspace=indent,eol,start

" 対応する括弧をハイライト
set showmatch
" ハイライトの時間を3秒に
set matchtime=3

" 編集中でも他のファイルを開けるようにする
set hidden

" 他でファイルが書き換えられたら自動で読み直す
set autoread

" 挿入モードでの単語補完時に大文字小文字を無視する
set infercase

" 矩形選択で自由に移動する
set virtualedit+=block

" テキスト整形オプション，マルチバイト系を追加
set formatoptions=lmoq

" 文字がない場所でのペースト時に空白を詰める
if has('virtualedit') && &virtualedit =~# '\<all\>'
  nnoremap <expr> p (col('.') >= col('$') ? '$' : '') . 'p'
endif

"---------------------------------------------------------------------------
" Search "{{{
"

" 最後まで検索したら先頭へ戻る
set wrapscan

" 大文字小文字無視
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索
set smartcase

" インクリメンタルサーチ
set incsearch

" 検索文字をハイライト
set hlsearch

"---------------------------------------------------------------------------
" Syntax "{{{
"

" シンタックスカラーをON
syntax enable

" 自動でインデント
set autoindent

" 新しい行のインデントを現在行と同じ量に
set smartindent

"---------------------------------------------------------------------------
" Key-mappings "{{{
"

" <C-s>で保存
noremap <C-S>	:update<CR>
vnoremap <C-S>	<C-C>:update<CR>
inoremap <C-S>	<C-O>:update<CR>

" ;でコマンドモードへ
noremap ; :
noremap : ;

" jjをEscとして使用
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

" ビジュアルモードでのインデントを<tab>で
xnoremap <TAB>    >
xnoremap <S-TAB>  <

" インデントを連続でできるように
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" :Ptでインデントモード切替
" command! Pt :set paste!
" pasteモード切り替え
imap <F11> <nop>
set pastetoggle=<F11>
" 挿入モードを抜けた時にnopasteに戻す
autocmd InsertLeave * set nopaste

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

" JとDで半ページ移動
nnoremap J <C-D>
nnoremap K <C-U>

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

" <Home>で行頭のテキストへ
inoremap <Home>  <C-o>^

" 挿入モードでのカーソル移動
imap <c-s-k> <Up>
imap <c-s-j> <Down>
imap <c-h> <Left>
imap <c-l> <Right>

" ノーマルモードでのバッファ移動
nmap <Space> ;bn<CR>
nmap <BS>    ;bp<CR>

" 挿入モードでのバッファ移動
imap <C-Tab>   <ESC>;bn<CR>a
imap <S-Tab>   <ESC>;bp<CR>a

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

" ノーマルモードで改行
nnoremap <CR>  o<Esc>

"---------------------------------------------------------------------------
" Plugins "{{{
"

"------------------------------------
" pathogen "{{{
"

" 一旦ファイルタイプ判定をoff
filetype off

" bundle配下のpluginをpathに加える
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt

" ファイルタイプ判定をon
filetype plugin on

"------------------------------------
" VimFiler "{{{
"

" $LINUXをコマンドで開く
nnoremap <F2> :VimFiler -buffer-name=explorer $LINUX<Cr>
" nnoremap <silent> <Space>vf :<C-U>VimFiler -create $LINUX<CR>
" splitで開く
nnoremap <F3> :VimFiler -buffer-name=explorer -split -winwidth=35 -toggle -no-quit $LINUX<Cr>
" nnoremap <silent> <Space>vfs :<C-U>VimFiler -create -split -simple -winwidth=35 -no-quit $LINUX<CR>

" デフォルトのエクスプローラnetrwをVimFilerに置き換え
" :e {ディレクトリ} で起動
let g:vimfiler_as_default_explorer = 1

" セーフモードで起動しないようにする
let g:vimfiler_safe_mode_by_default = 0

" 設定ファイルを書き出すディレクトリ
let g:vimfiler_data_directory = $VIM.'/.vimfiler'

" マップ設定
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', my_action)

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', my_action)

"------------------------------------
" restart.vim "{{{
"

" :Rsで再起動
let g:restart_command = 'Rs'

"------------------------------------
" mru.vim "{{{
"

" データ保存場所
let MRU_File = $VIM.'/_vim_mru_files'

"------------------------------------
" jQuery syntax "{{{
"

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

"------------------------------------
" Zen-Coding "{{{
"

" リーダーキー
let g:user_zen_leader_key = '<c-e>'

" 要素の展開
let g:user_zen_expandabbr_key = '<c-e>'

" 個人設定
let g:user_zen_settings = {
\  'lang' : 'ja',
\  'charset' : 'utf-8',
\  'html' : {
\    'filters' : 'html',
\    'snippets' : {
\       'html:5': "<!DOCTYPE html>\n"
\                ."<html lang=\"${lang}\">\n"
\                ."<head>\n"
\                ."    <meta charset=\"${charset}\" />\n"
\                ."    <title></title>\n"
\                ."</head>\n"
\                ."<body>\n"
\                ."    |\n"
\                ."</body>\n"
\                ."</html>",
\       'html:5js': "<!--[if lt IE 9]>\n"
\                  ."<script src=\"http://html5shiv.googlecode.com/svn/trunk/html5.js\"></script>\n"
\                  ."<![endif]-->\n",
\       'jq': "<script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js\"></script>\n"
\            ."<script>\n"
\            ."\\$(function() {\n"
\            ."    |\n"
\            ."});\n"
\            ."</script>",
\    },
\  },
\  'javascript' : {
\    'snippets' : {
\       'jq': "\\$(function() {\n"
\              ."    |\n"
\              ."});\n",
\       'fn': "(function() {\n"
\            ."    |\n"
\            ."})();",
\       'tm': "setTimeout(function() {\n"
\            ."    |\n"
\            ."}, 100);",
\    },
\  },
\}

"------------------------------------
" YankRing.vim "{{{
"

" Yankの履歴参照
nmap ,y ;YRShow<CR>

"------------------------------------
" MiniBufExplorer "{{{
"

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplSplitBelow = 0
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplSplitToEdge = 1
let g:miniBufExplMaxSize = 10

"------------------------------------
" NERD_commenter.vim "{{{
"

" コメントの間にスペースを空ける
let NERDSpaceDelims = 1

" コメントをトグル
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" 未対応ファイルタイプのエラーメッセージを表示しない
let NERDShutUp = 1

"------------------------------------
" open-blowser.vim "{{{
"

" カーソル下のURLをブラウザで開く
nmap fu <Plug>(openbrowser-open)
vmap fu <Plug>(openbrowser-open)

" カーソル下のキーワードをググる
nnoremap fs :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

"------------------------------------
" textmanip.vim "{{{
"

" 選択したテキストの移動
vmap <C-j> <Plug>(Textmanip.move_selection_down)
vmap <C-k> <Plug>(Textmanip.move_selection_up)
vmap <C-h> <Plug>(Textmanip.move_selection_left)
vmap <C-l> <Plug>(Textmanip.move_selection_right)

" 行の複製(<M>はAlt)
vmap <M-d> <Plug>(Textmanip.duplicate_selection_v)
nmap <M-d> <Plug>(Textmanip.duplicate_selection_n)

"------------------------------------
" surround.vim "{{{
"

" 自動的に囲み文字を判別して中身を削除
nnoremap ci :call <SID>ExSurround("ci")<CR>
nnoremap di :call <SID>ExSurround("di")<CR>
function! s:ExSurround(cmd)
    let pattern = "'\"{[("
    let front = strpart(getline("."), 0, col("."))
    let max = -1
    for pat in split(pattern, '.\zs')
        let pos = strridx(front, pat)
        if pos > max
            let max = pos
        endif
    endfor
    if max >= 0
        let sorround = strpart(front, max, 1)
        call feedkeys(a:cmd . sorround, 'n')
    endif
endfunction

"------------------------------------
" unite.vim "{{{
"

nnoremap    [unite]   <Nop>
nmap    f [unite]

" 入力モードで開始する
let g:unite_enable_start_insert = 1

" 分割しないでuniteのbufferを表示する
nnoremap [unite]u  :<C-u>Unite -no-split<Space>

" 全部乗せ
nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -no-split -buffer-name=files buffer file_mru bookmark file<CR>

" ファイル一覧
nnoremap <silent> [unite]f  :<C-u>Unite -no-split -buffer-name=files file<CR>

" バッファ一覧
nnoremap <silent> [unite]b  :<C-u>Unite -no-split buffer<CR>

" 常用セット
nnoremap <silent> [unite]u  :<C-u>Unite -no-split buffer file_mru<CR>

" 最近使用したファイル一覧
nnoremap <silent> [unite]m  :<C-u>Unite -no-split file_mru<CR>

" 現在のバッファのカレントディレクトリからファイル一覧
nnoremap <silent> [unite]d  :<C-u>UniteWithBufferDir -no-split file<CR>

" 設定ファイルを書き出すディレクトリ
let g:unite_data_directory = $VIM.'/.unite'

"------------------------------------
" vimshell "{{{
"

" ノーマルモードで起動
nnoremap <silent> vs :VimShell<CR>

" 設定
let g:vimshell_prompt = '% '
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_temporary_directory = $VIM.'/.vimshell'
let g:vimshell_enable_smart_case = 1

if s:is_windows
  let g:vimshell_prompt = $USERNAME."% "
else
  let g:vimshell_prompt = $USER."% "
  call vimshell#set_execute_file('bmp,jpg,png,gif', 'gexe eog')
  call vimshell#set_execute_file('mp3,m4a,ogg', 'gexe amarok')
  let g:vimshell_execute_file_list['zip'] = 'zipinfo'
  call vimshell#set_execute_file('tgz,gz', 'gzcat')
  call vimshell#set_execute_file('tbz,bz2', 'bzcat')
endif

" Initialize execute file list.
let g:vimshell_execute_file_list = {}
call vimshell#set_execute_file('txt,vim,c,h,cpp,d,xml,java', 'vim')
let g:vimshell_execute_file_list['rb'] = 'ruby'
let g:vimshell_execute_file_list['pl'] = 'perl'
let g:vimshell_execute_file_list['py'] = 'python'
call vimshell#set_execute_file('html,xhtml', 'gexe firefox')

autocmd FileType vimshell
\ call vimshell#altercmd#define('g', 'git')
\| call vimshell#altercmd#define('i', 'iexe')
\| call vimshell#altercmd#define('l', 'll')
\| call vimshell#altercmd#define('ll', 'ls -l')
\| call vimshell#hook#add('chpwd', 'my_chpwd', 'g:my_chpwd')

function! g:my_chpwd(args, context)
  call vimshell#execute('ls')
endfunction

autocmd FileType int-* call s:interactive_settings()
function! s:interactive_settings()
endfunction

"------------------------------------
" neocomplcache "{{{
"

" 補完ウィンドウの設定
set completeopt=menuone

" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1

" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3

" バッファや辞書ファイル中の補完対象となるキーワードの最小長
let g:neocomplcache_min_keyword_length = 3

" クイックマッチ時に自動で候補を選択
let g:neocomplcache_enable_auto_select = 1

" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 100

" 一時ファイルを書き出すディレクトリ
let g:neocomplcache_temporary_dir = $VIM.'/.neocon'

" 補完するためのキーワードパターンを記録
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" シンタックス補完を無効に
let g:neocomplcache_plugin_disable = {
  \ 'syntax_complete' : 1,
  \ }

" 標準で用意されているスニペットを無効にする
let g:neocomplcache_snippets_disable_runtime_snippets = 1

" スニペット補完ファイルのパス
" let g:neocomplcache_snippets_dir = $VIM.'/snippets'

" 前回補完された内容を元に戻す
inoremap <expr><C-g>   neocomplcache#undo_completion()

" ポップアップを確実に閉じる
inoremap <expr><BS>    neocomplcache#smart_close_popup()."\<C-h>"

" 補完候補を選択する（選択する度に元のキーワードを更新）
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ neocomplcache#start_manual_complete()
function! s:check_back_space()"{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" 補完候補を逆順で選択する
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"

" スニペットを展開
" imap <c-e>     <Plug>(neocomplcache_snippets_expand)
" smap <c-e>     <Plug>(neocomplcache_snippets_expand)

" スニペットファイルを編集する
" nnoremap <Space>ns :NeoComplCacheEditSnippets

