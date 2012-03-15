"-----------------------------------------------------------------------------
" Basics
"-----------------------------------------------------------------------------

let mapleader = ","              " �L�[�}�b�v���[�_�[���u,�v�ɂ���
set scrolloff=5                  " �X�N���[�����̗]���m��
set textwidth=0                  " ��s�ɒ������͂������Ă��Ă������܂�Ԃ������Ȃ�
set nobackup                     " �o�b�N�A�b�v���Ȃ�
set autoread                     " ���ŏ���������ꂽ�玩���œǂݒ���
set noswapfile                   " �X���b�v�t�@�C�����Ȃ�
set hidden                       " �ҏW���ł����̃t�@�C�����J����悤�ɂ���
set backspace=indent,eol,start   " �o�b�N�X�y�[�X�łȂ�ł�������悤��
set formatoptions=lmoq           " �e�L�X�g���`�I�v�V�����C�}���`�o�C�g�n��ǉ�
set vb t_vb=                     " �r�[�v���Ȃ炳�Ȃ�
set browsedir=buffer             " Explore�̏����f�B���N�g��
set whichwrap=b,s,h,l,<,>,[,]    " �J�[�\�����s���A�s���Ŏ~�܂�Ȃ��悤�ɂ���
set showcmd                      " �R�}���h���X�e�[�^�X�s�ɕ\��
set showmode                     " ���݂̃��[�h��\��
set viminfo+=!                   " viminfo�t�@�C���̐ݒ�
set modelines=0                  " ���[�h���C���͖���
set cmdheight=3                  " �R�}���h���͗��̍���
set title                        " �^�C�g����\��
set shortmess+=I                 " �X�v���b�V����\�����Ȃ�
set shellslash                   " Win�̃f�B���N�g���p�X�̋�؂��/���g����悤��
set clipboard+=unnamed           " OS�̃N���b�v�{�[�h���g�p����
set clipboard+=unnamed           " �����N����������OS�̃N���b�v�{�[�h�ɓ����
set clipboard+=unnamedplus       " YankRing�p�̐ݒ�
set nrformats-=octal             " 8�i���𖳌��ɂ���
set mouse=a                      " �^�[�~�i���Ń}�E�X���g�p�ł���悤�ɂ���

"-----------------------------------------------------------------------------
" Original
"-----------------------------------------------------------------------------

" <C-s>�ŕۑ�����
noremap <C-S>	:update<CR>
vnoremap <C-S>	<C-C>:update<CR>
inoremap <C-S>	<C-O>:update<CR>

" ;�ŃR�}���h����
noremap ; :
noremap : ;

" jj��Esc�Ƃ��Ďg�p����
inoremap jj <Esc>

" <C-i>�Ńw���v���J��
nnoremap <C-i>  :<C-u>help<Space>
" �J�[�\�����̃L�[���[�h���w���v�łЂ�
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

" �ݒ�t�@�C�����R�}���h�ŊJ��
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>

" �ݒ�t�@�C���݂̂��ċN��
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>

" html�t�@�C���̑���URL��gf�ŊJ��
autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/

"-----------------------------------------------------------------------------
" StatusLine
"-----------------------------------------------------------------------------

" ��ɃX�e�[�^�X���C����\��
set laststatus=2

" �J�[�\�������s�ڂ̉���ڂɒu����Ă��邩��\������
set ruler

" �X�e�[�^�X���C���ɕ����R�[�h�Ɖ��s������\������
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %t%=[%{GetB()}]\ %l,%c%V%8P

" �}�����[�h���A�X�e�[�^�X���C���̃J���[��ύX
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
set autoindent             " �����ŃC���f���g
set showmatch              " ���ʂ̑Ή����n�C���C�g
set number                 " �s�ԍ��\��
" set list                 " �s�������\��
" set listchars=tab:>.,trail:_,extends:>,precedes:< " �s�������̕\���`��
set display=uhex           " �󎚕s�\������16�i���ŕ\��

" �S�p�X�y�[�X�̕\��
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /�@/

" �J�[�\���s���n�C���C�g
set cursorline

" �^�u�y�[�W����ɕ\��
" set showtabline=2
" gVim�ł��e�L�X�g�x�[�X�̃^�u�y�[�W���g��
" set guioptions-=e

" �J�����g�E�B���h�E�ɂ̂݌r��������
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" �R�}���h���s���͍ĕ`�悵�Ȃ�
:set lazyredraw

" �����^�[�~�i���ڑ����s��
:set ttyfast

"-----------------------------------------------------------------------------
" Indent
"-----------------------------------------------------------------------------

set autoindent             " �����ŃC���f���g
set smartindent            " �V�����s�̃C���f���g�����ݍs�Ɠ����ʂ�

" :Pt�ŃC���f���g���[�h�ؑ�
command! Pt :set paste!

" �������Ȃ��ꏊ�ł̃y�[�X�g���ɋ󔒂��l�߂�
if has('virtualedit') && &virtualedit =~# '\<all\>'
    nnoremap <expr> p (col('.') >= col('$') ? '$' : '') . 'p'
endif

" �^�u�̓^�u�Ŏg��
" set tabstop=8 shiftwidth=8 softtabstop=0

" �^�u���󔒂ɕϊ����Ȃ�
set noexpandtab

"-----------------------------------------------------------------------------
" Complete
"-----------------------------------------------------------------------------

set wildmenu              " �R�}���h�⊮������
set wildchar=<tab>        " �R�}���h�⊮���J�n����L�[
set wildmode=list:full    " ���X�g�\���C�Œ��}�b�`
set history=1000          " �R�}���h�E�����p�^�[���̗���
set complete+=k           " �⊮�Ɏ����t�@�C���ǉ�

"-----------------------------------------------------------------------------
" Search
"-----------------------------------------------------------------------------

set wrapscan              " �Ō�܂Ō���������擪�֖߂�
set ignorecase            " �啶������������
set smartcase             " ����������ɑ啶�����܂܂�Ă���ꍇ�͋�ʂ��Č�������
set incsearch             " �C���N�������^���T�[�`
set hlsearch              " �����������n�C���C�g

" Esc��2�񉟂��Ńn�C���C�g����
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

" �I�����������������
" �J�[�\�����̃L�[���[�h�����́A�u*�v
" ���͂̒��ɂ���ꍇ����������ꍇ�́A�ug*�v
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" �m�[�}�����[�h�Łus*�v�̂��Ɓu�u���㕶����/g<Cr>�v�ŃJ�[�\�����̕������u��
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

" �������ʂɈړ����������̈ʒu����ʂ̒����ɂ���
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" �������A�u/�v�̓��͂��G�X�P�[�v����
" cnoremap  / getcmdtype() == '/' ? '\/' : '/'

"-----------------------------------------------------------------------------
" Move
"-----------------------------------------------------------------------------

" J��D�Ŕ��y�[�W�ړ�
nnoremap J <C-D>
nnoremap K <C-U>

nnoremap <C-U> <C-Y>2<C-Y>2<C-Y>2<C-Y>2<C-Y><C-Y>
nnoremap <C-D> <C-E>2<C-E>2<C-E>2<C-E>2<C-E><C-E>

" �J�[�\����\���s�ňړ�����
" �_���s�ړ���<C-n>,<C-p>
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
nnoremap <Down> gj
nnoremap <Up>   gk

" 0, 9�ōs���A�s����
nmap 8 0
nmap 9 ^
nmap 0 $

" �}�����[�h�ł̃J�[�\���ړ�
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

" �m�[�}�����[�h�ł̃o�b�t�@�ړ�
nmap <Space> ;bn<CR>
nmap <BS>    ;bp<CR>

" �}�����[�h�ł̃o�b�t�@�ړ�
imap <C-Tab>   <ESC>;bn<CR>a
imap <C-S-Tab> <ESC>;bp<CR>a

" F4�Ńo�b�t�@���폜����
map <F4> <ESC>;bw<CR>

" �t���[���T�C�Y��ӑĂɕύX����
map <kPlus>  <C-W>+
map <kMinus> <C-W>-

" �O��I�������J�[�\���s�Ɉړ�
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" �Ō�ɕҏW���ꂽ�ʒu�Ɉړ�
nnoremap gb '[
nnoremap gp ']

" �Ή����銇�ʂɈړ�
nnoremap [ %
nnoremap ] %

" �J�[�\���ʒu�̒P���yank����
nnoremap vy vawy

" ��`�I���Ŏ��R�Ɉړ�����
set virtualedit+=block

" �r�W���A�����[�h��v�ōs���܂őI��
vnoremap v $h

" <C-hjkl>�ŃE�B���h�E�ړ�
nnoremap <C-j> ;<C-w>j
nnoremap <C-k> ;<C-k>j
nnoremap <C-l> ;<C-l>j
nnoremap <C-h> ;<C-h>j

" ���ʂ܂ł�I������
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

" �^�[�~�i���^�C�v�ɂ��J���[�ݒ�
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86" || &term =~ "xterm-256color"
 set t_Co=16
 set t_Sf=^[[3%dm
 set t_Sb=^[[4%dm
elseif &term =~ "xterm-color"
 set t_Co=8
 set t_Sf=^[[3%dm
 set t_Sb=^[[4%dm
endif

" �n�C���C�g on
syntax enable

" �⊮���̐F�Â� for vim7
hi Pmenu ctermbg=white ctermfg=darkgray
hi PmenuSel ctermbg=blue ctermfg=white
hi PmenuSbar ctermbg=0 ctermfg=9

"-----------------------------------------------------------------------------
" Edit
"-----------------------------------------------------------------------------

" �}�����[�h�ŃN���b�v�{�[�h�̓��e���y�[�X�g
imap <C-v>  <ESC>"*pa

" �}�����[�h�ŃA���h�D�E���h�D
imap <C-z>  <ESC>ua
imap <C-a>  <ESC><C-r>a

" �}�����[�h�ŒP��P��/�s�P�ʂ̍폜���A���h�D�\�ɂ���
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>

" y9�ōs���܂Ń����N
nmap y9 y$
" y0�ōs���܂Ń����N
nmap y0 y^

" ���ʂ̎����J�[�\���ړ�
inoremap {}  {}<LEFT>
inoremap []  []<LEFT>
inoremap ()  ()<LEFT>
inoremap ""  ""<LEFT>
inoremap ''  ''<LEFT>

" �ۑ����ɍs���̋󔒂���������
autocmd BufWritePre * :%s/\s\+$//ge
" �ۑ�����tab���X�y�[�X�ɕϊ�����
" autocmd BufWritePre * :%s/\t/  /ge
"
"-----------------------------------------------------------------------------
" Plugins
"-----------------------------------------------------------------------------

"------------------------------------
" pathogen
"------------------------------------

" pathogen��ftdetect�Ȃǂ�load�����邽�߂Ɉ�x�t�@�C���^�C�v�����off
filetype off

" pathogen.vim�ɂ����bundle�z����plugin��path�ɉ�����
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt

" �t�@�C���^�C�v�����on
filetype plugin on

"------------------------------------
" VimFiler
"------------------------------------

" $LINUX���R�}���h�ŊJ��
nnoremap <silent> <Space>vf :<C-U>VimFiler -create $LINUX<CR>

" �f�t�H���g�̃G�N�X�v���[��netrw��VimFiler�ɒu������
" :e {�f�B���N�g��} �ŋN��
let g:vimfiler_as_default_explorer = 1

" �Z�[�t���[�h�ŋN�����Ȃ��悤�ɂ���
let g:vimfiler_safe_mode_by_default=0

"------------------------------------
" restart.vim
"------------------------------------

" :Rs�ōċN��
let g:restart_command = 'Rs'

" :Rsw�ŃZ�b�V��������ōċN��
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

" <C-e>�œW�J
let g:user_zen_expandabbr_key = '<c-e>'

" �W�J����HTML�̌����ݒ�
let g:user_zen_settings = {'lang' : 'ja'}

"------------------------------------
" YankRing.vim
"------------------------------------

" Yank�̗����Q��
nmap ,y ;YRShow<CR>

"------------------------------------
" MiniBufExplorer
"------------------------------------

" set minibfexp
let g:miniBufExplMapWindowNavVim=1 "hjkl�ňړ�
let g:miniBufExplSplitBelow=0  " Put new window above
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1
let g:miniBufExplMaxSize = 10

" :Tm��MiniBufExplorer�̕\���g�O��
command! Mt :TMiniBufExplorer

"------------------------------------
" NERD_commenter.vim
"------------------------------------

" �R�����g�̊ԂɃX�y�[�X���󂯂�
let NERDSpaceDelims = 1

" �R�����g���g�O��
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" ���Ή��t�@�C���^�C�v�̃G���[���b�Z�[�W��\�����Ȃ�
let NERDShutUp = 1

"------------------------------------
" VTreeExplorer
"------------------------------------

" �m�[�}�����[�h�ŋN��
nnoremap <silent> <Space>vt :VSTreeExplore<CR>

" �c�ɕ\������
let g:treeExplVertical = 1

" ���������E�B���h�E�̃T�C�Y
let g:treeExplWinSize = 30

"------------------------------------
" open-blowser.vim
"------------------------------------

" �J�[�\������URL���u���E�U�ŊJ��
nmap fu <Plug>(openbrowser-open)
vmap fu <Plug>(openbrowser-open)

" �J�[�\�����̃L�[���[�h���O�O��
nnoremap fs :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

"------------------------------------
" textmanip.vim
"------------------------------------

" �I�������e�L�X�g�̈ړ�
vmap <C-j> <Plug>(Textmanip.move_selection_down)
vmap <C-k> <Plug>(Textmanip.move_selection_up)
vmap <C-h> <Plug>(Textmanip.move_selection_left)
vmap <C-l> <Plug>(Textmanip.move_selection_right)

" �s�̕���(<M>��Alt)
vmap <M-d> <Plug>(Textmanip.duplicate_selection_v)
nmap <M-d> <Plug>(Textmanip.duplicate_selection_n)

"------------------------------------
" surround.vim
"------------------------------------

" s, ss�őI��͈͂��w�蕶���ł�����
" nmap s <Plug>Ysurround
" nmap <Plug>Yssurround

"------------------------------------
" smooth_scroll.vim
"------------------------------------

" <PageDown>��<PageUp>�ŃX���[�Y�X�N���[������
" nnoremap <PageDown> :<C-u>call SmoothScroll("d",1,1)<CR>
" nnoremap <PageDown> <c-f>
" nnoremap <PageUp><C-B>

"------------------------------------
" unite.vim
"------------------------------------

" ���̓��[�h�ŊJ�n����
let g:unite_enable_start_insert=1
" �o�b�t�@�ꗗ
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" �t�@�C���ꗗ
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" ���W�X�^�ꗗ
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" �ŋߎg�p�����t�@�C���ꗗ
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" �u�b�N�}�[�N�ꗗ
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

" �m�[�}�����[�h�ŋN��
nnoremap <silent> vs :VimShell<CR>

" �V�F���R�}���h�̃p�X��ʂ�
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

" es�ŃX�j�y�b�g�ҏW�ł���悤�ɂ���
noremap es :<C-u>NeoComplCacheEditSnippets<CR>
