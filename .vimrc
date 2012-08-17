"---------------------------------------------------------------------------
" konitter's .vimrc
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
" Initialize "{{{
"

" Vi�݊����I�t
set nocompatible

" �L�[�}�b�v���[�_�[���u,�v�ɂ���
let mapleader = ","

if has('win32') || has('win64')

  " Win�̃f�B���N�g���p�X�̋�؂��/���g����悤��
  set shellslash

  " Linux�T�[�o�����ϐ��Ɏw��
  let $LINUX = "//Hp-serv-linux/htdocs"

  " viminfo�t�@�C���̏o�͐�
  set viminfo+=nC:/Users/H001022/Dropbox/tools/vim/_viminfo

endif

"---------------------------------------------------------------------------
" View "{{{
"

" �^�[�~�i���Ń}�E�X���g�p�ł���悤�ɂ���
set mouse=a

" �s�ԍ���\������
set number

" �s�������̕\��
" set list
" �s�������̕\���`��
" set listchars=tab:\|\

" �E�B���h�E����蒷���s��܂�Ԃ�
set wrap
" �J�[�\�����s��/���ɂ��鎞�ɑO/���s�Ɉړ��ł���悤��
set whichwrap=b,s,h,l,<,>,[,]

" �^�C�g����\��
set title

" �X�v���b�V����ʂ�\�����Ȃ�
set shortmess+=I

" �ŏI�s�Ɍ��݂̃��[�h��\��
set showmode

" �X�N���[�����̗]���m��
set scrolloff=5

" �o�b�t�@�ŊJ���Ă���f�B���N�g����Explore�̏����f�B���N�g����
set browsedir=buffer

" �o�b�N�A�b�v�����Ȃ�
set nobackup
set nowritebackup

" �X���b�v�t�@�C�������Ȃ�
set noswapfile

" 8�i���𖳌��ɂ���
set nrformats-=octal
" �󎚕s�\������16�i���ŕ\��
set display=uhex

" �r�[�v����炳�Ȃ�
set visualbell
set vb t_vb=

" �R�}���h�E�t�@�C�����⊮�̊g���@�\���g�p
set wildmenu
" �⊮���J�n����L�[
set wildchar=<tab>
" ���X�g�\���C�Œ��}�b�`
set wildmode=list:longest,full

" �R�}���h�E�����p�^�[���̗���
set history=1000

" �⊮�Ɏ����t�@�C���ǉ�
set complete+=k

" �J�[�\�������s�ڂ̉���ڂɒu����Ă��邩��\������
set ruler
" �J�[�\���s���n�C���C�g
set cursorline
" �c�������n�C���C�g
" set cursorcolumn

" �R�}���h���s���ɉ�ʂ�`�悵�Ȃ�
set lazyredraw

" �R�}���h���͗��̍�����3�s���ɐݒ�
set cmdheight=3

" ��ɃX�e�[�^�X���C����\��
set laststatus=2
" �R�}���h���X�e�[�^�X���C���ɕ\��
set showcmd
" �X�e�[�^�X���C���ɕ����R�[�h�Ɖ��s������\������
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %t%=%l,%c%V%8P

" �S�p�X�y�[�X�̕\��
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /�@/

" �^�u�y�[�W����ɕ\��
" set showtabline=2

"---------------------------------------------------------------------------
" Edit "{{{
"

" �^�u���ݒ�
" set tabstop=8 shiftwidth=8 softtabstop=0
" �^�u���󔒂ɕϊ����Ȃ�
set noexpandtab

" .js�̂݃^�u���ƃ^�u���󔒂ɂ���ݒ�
au BufNewFile,BufRead *.js set expandtab tabstop=8 shiftwidth=4
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" �t�@�C�����Ƃ̐ݒ��L���ɂ���
set modeline
set modelines=2

" OS�̃N���b�v�{�[�h���g�p����
set clipboard+=unnamed

" �����Ő܂�Ԃ������Ȃ�
set textwidth=0

" �o�b�N�X�y�[�X�ŉ��ł�������悤��
set backspace=indent,eol,start

" �Ή����銇�ʂ��n�C���C�g
set showmatch
" �n�C���C�g�̎��Ԃ�3�b��
set matchtime=3

" �ҏW���ł����̃t�@�C�����J����悤�ɂ���
set hidden

" ���Ńt�@�C��������������ꂽ�玩���œǂݒ���
set autoread

" �}�����[�h�ł̒P��⊮���ɑ啶���������𖳎�����
set infercase

" ��`�I���Ŏ��R�Ɉړ�����
set virtualedit+=block

" �e�L�X�g���`�I�v�V�����C�}���`�o�C�g�n��ǉ�
set formatoptions=lmoq

" �������Ȃ��ꏊ�ł̃y�[�X�g���ɋ󔒂��l�߂�
if has('virtualedit') && &virtualedit =~# '\<all\>'
  nnoremap <expr> p (col('.') >= col('$') ? '$' : '') . 'p'
endif

"---------------------------------------------------------------------------
" Search "{{{
"

" �Ō�܂Ō���������擪�֖߂�
set wrapscan

" �啶������������
set ignorecase

" ����������ɑ啶�����܂܂�Ă���ꍇ�͋�ʂ��Č���
set smartcase

" �C���N�������^���T�[�`
set incsearch

" �����������n�C���C�g
set hlsearch

"---------------------------------------------------------------------------
" Syntax "{{{
"

" �V���^�b�N�X�J���[��ON
syntax enable

" �����ŃC���f���g
set autoindent

" �V�����s�̃C���f���g�����ݍs�Ɠ����ʂ�
set smartindent

"---------------------------------------------------------------------------
" Key-mappings "{{{
"

" <C-s>�ŕۑ�
noremap <C-S>	:update<CR>
vnoremap <C-S>	<C-C>:update<CR>
inoremap <C-S>	<C-O>:update<CR>

" ;�ŃR�}���h���[�h��
noremap ; :
noremap : ;

" jj��Esc�Ƃ��Ďg�p
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

" �r�W���A�����[�h�ł̃C���f���g��<tab>��
xnoremap <TAB>    >
xnoremap <S-TAB>  <

" �C���f���g��A���łł���悤��
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" :Pt�ŃC���f���g���[�h�ؑ�
" command! Pt :set paste!
" paste���[�h�؂�ւ�
imap <F11> <nop>
set pastetoggle=<F11>
" �}�����[�h�𔲂�������nopaste�ɖ߂�
autocmd InsertLeave * set nopaste

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

" J��D�Ŕ��y�[�W�ړ�
nnoremap J <C-D>
nnoremap K <C-U>

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

" <Home>�ōs���̃e�L�X�g��
inoremap <Home>  <C-o>^

" �}�����[�h�ł̃J�[�\���ړ�
imap <c-s-k> <Up>
imap <c-s-j> <Down>
imap <c-h> <Left>
imap <c-l> <Right>

" �m�[�}�����[�h�ł̃o�b�t�@�ړ�
nmap <Space> ;bn<CR>
nmap <BS>    ;bp<CR>

" �}�����[�h�ł̃o�b�t�@�ړ�
imap <C-Tab>   <ESC>;bn<CR>a
imap <S-Tab>   <ESC>;bp<CR>a

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

" �m�[�}�����[�h�ŉ��s
nnoremap <CR>  o<Esc>

"---------------------------------------------------------------------------
" Plugins "{{{
"

"------------------------------------
" pathogen "{{{
"

" ��U�t�@�C���^�C�v�����off
filetype off

" bundle�z����plugin��path�ɉ�����
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt

" �t�@�C���^�C�v�����on
filetype plugin on

"------------------------------------
" VimFiler "{{{
"

" $LINUX���R�}���h�ŊJ��
nnoremap <F2> :VimFiler -buffer-name=explorer $LINUX<Cr>
" nnoremap <silent> <Space>vf :<C-U>VimFiler -create $LINUX<CR>
" split�ŊJ��
nnoremap <F3> :VimFiler -buffer-name=explorer -split -winwidth=35 -toggle -no-quit $LINUX<Cr>
" nnoremap <silent> <Space>vfs :<C-U>VimFiler -create -split -simple -winwidth=35 -no-quit $LINUX<CR>

" �f�t�H���g�̃G�N�X�v���[��netrw��VimFiler�ɒu������
" :e {�f�B���N�g��} �ŋN��
let g:vimfiler_as_default_explorer = 1

" �Z�[�t���[�h�ŋN�����Ȃ��悤�ɂ���
let g:vimfiler_safe_mode_by_default = 0

" �ݒ�t�@�C���������o���f�B���N�g��
let g:vimfiler_data_directory = $VIM.'/.vimfiler'

" �}�b�v�ݒ�
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

" :Rs�ōċN��
let g:restart_command = 'Rs'

"------------------------------------
" mru.vim "{{{
"

" �f�[�^�ۑ��ꏊ
let MRU_File = $VIM.'/_vim_mru_files'

"------------------------------------
" jQuery syntax "{{{
"

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

"------------------------------------
" Zen-Coding "{{{
"

" ���[�_�[�L�[
let g:user_zen_leader_key = '<c-e>'

" �v�f�̓W�J
let g:user_zen_expandabbr_key = '<c-e>'

" �l�ݒ�
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

" Yank�̗����Q��
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

" �R�����g�̊ԂɃX�y�[�X���󂯂�
let NERDSpaceDelims = 1

" �R�����g���g�O��
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" ���Ή��t�@�C���^�C�v�̃G���[���b�Z�[�W��\�����Ȃ�
let NERDShutUp = 1

"------------------------------------
" VTreeExplorer "{{{
"

" �m�[�}�����[�h�ŋN��
nnoremap <silent> <Space>vt :VSTreeExplore<CR>

" �c�ɕ\������
let g:treeExplVertical = 1

" ���������E�B���h�E�̃T�C�Y
let g:treeExplWinSize = 30

"------------------------------------
" open-blowser.vim "{{{
"

" �J�[�\������URL���u���E�U�ŊJ��
nmap fu <Plug>(openbrowser-open)
vmap fu <Plug>(openbrowser-open)

" �J�[�\�����̃L�[���[�h���O�O��
nnoremap fs :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

"------------------------------------
" textmanip.vim "{{{
"

" �I�������e�L�X�g�̈ړ�
vmap <C-j> <Plug>(Textmanip.move_selection_down)
vmap <C-k> <Plug>(Textmanip.move_selection_up)
vmap <C-h> <Plug>(Textmanip.move_selection_left)
vmap <C-l> <Plug>(Textmanip.move_selection_right)

" �s�̕���(<M>��Alt)
vmap <M-d> <Plug>(Textmanip.duplicate_selection_v)
nmap <M-d> <Plug>(Textmanip.duplicate_selection_n)

"------------------------------------
" operator-replace.vim "{{{
"

" �����N������������uR�v�Œu��
nmap R <Plug>(operator-replace)

"------------------------------------
" surround.vim "{{{
"

" �����I�Ɉ͂ݕ����𔻕ʂ��Ē��g���폜
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

" ���̓��[�h�ŊJ�n����
let g:unite_enable_start_insert = 1

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

" �ݒ�t�@�C���������o���f�B���N�g��
let g:unite_data_directory = $VIM.'/.unite'

"------------------------------------
" vimshell "{{{
"

" �m�[�}�����[�h�ŋN��
nnoremap <silent> vs :VimShell<CR>

" �V�F���R�}���h�̃p�X��ʂ�
let $PATH = $VIM.'\bin'.';'.$PATH

" �ݒ�
let g:vimshell_interactive_update_time = 10
let g:vimshell_prompt = '$ '
let g:vimshell_right_prompt = 'vimshell#vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
let g:vimshell_enable_smart_case = 1
let g:vimshell_temporary_directory = $VIM.'/.vimshell'

"------------------------------------
" neocomplcache "{{{
"

" �⊮�E�B���h�E�̐ݒ�
set completeopt=menuone

" �N�����ɗL����
let g:neocomplcache_enable_at_startup = 1

" �啶�������͂����܂ő啶���������̋�ʂ𖳎�����
let g:neocomplcache_enable_smart_case = 1

" �V���^�b�N�X���L���b�V������Ƃ��̍ŏ�������
let g:neocomplcache_min_syntax_length = 3

" �o�b�t�@�⎫���t�@�C�����̕⊮�ΏۂƂȂ�L�[���[�h�̍ŏ���
let g:neocomplcache_min_keyword_length = 3

" �N�C�b�N�}�b�`���Ɏ����Ō���I��
let g:neocomplcache_enable_auto_select = 1

" �|�b�v�A�b�v���j���[�ŕ\���������̐�
let g:neocomplcache_max_list = 100

" �ꎞ�t�@�C���������o���f�B���N�g��
let g:neocomplcache_temporary_dir = $VIM.'/.neocon'

" �⊮���邽�߂̃L�[���[�h�p�^�[�����L�^
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" �V���^�b�N�X�⊮�𖳌���
let g:neocomplcache_plugin_disable = {
  \ 'syntax_complete' : 1,
  \ }

" �W���ŗp�ӂ���Ă���X�j�y�b�g�𖳌��ɂ���
let g:neocomplcache_snippets_disable_runtime_snippets = 1

" �X�j�y�b�g�⊮�t�@�C���̃p�X
" let g:neocomplcache_snippets_dir = $VIM.'/snippets'

" �O��⊮���ꂽ���e�����ɖ߂�
inoremap <expr><C-g>   neocomplcache#undo_completion()

" �|�b�v�A�b�v���m���ɕ���
inoremap <expr><BS>    neocomplcache#smart_close_popup()."\<C-h>"

" �⊮����I������i�I������x�Ɍ��̃L�[���[�h���X�V�j
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ neocomplcache#start_manual_complete()
function! s:check_back_space()"{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" �⊮�����t���őI������
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"

" �X�j�y�b�g��W�J
" imap <c-e>     <Plug>(neocomplcache_snippets_expand)
" smap <c-e>     <Plug>(neocomplcache_snippets_expand)

" �X�j�y�b�g�t�@�C����ҏW����
" nnoremap <Space>ns :NeoComplCacheEditSnippets

