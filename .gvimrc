" �c�[���o�[���\��
set guioptions-=T

" �J���[�ݒ�
" http://dengmao.wordpress.com/2007/01/22/vim-color-scheme-wombat/
colorscheme wombat

" �t�H���g�ݒ�
set guifont=Consolas:h10,Lucida_Console:h10:w5
set guifontwide=VL_Gothic:h9:cSHIFTJIS

" Window�ʒu�̕ۑ��ƕ��A
if has('unix')
  let s:infofile = '~/.vim/.vimpos'
else
  let s:infofile = '~/_vimpos'
endif

function! s:SaveWindowParam(filename)
  redir => pos
  exec 'winpos'
  redir END
  let pos = matchstr(pos, 'X[-0-9 ]\+,\s*Y[-0-9 ]\+$')
  let file = expand(a:filename)
  let str = []
  let cmd = 'winpos '.substitute(pos, '[^-0-9 ]', '', 'g')
  cal add(str, cmd)
  let l = &lines
  let c = &columns
  cal add(str, 'set lines='. l.' columns='. c)
  silent! let ostr = readfile(file)
  if str != ostr
    call writefile(str, file)
  endif
endfunction

augroup SaveWindowParam
  autocmd!
  execute 'autocmd SaveWindowParam VimLeave * call s:SaveWindowParam("'.s:infofile.'")'
augroup END

if filereadable(expand(s:infofile))
  execute 'source '.s:infofile
endif
unlet s:infofile

" ���j���[�A�C�e���쐬
silent! aunmenu &File.Save
silent! aunmenu &File.�ۑ�(&S)
silent! aunmenu &File.�����\��(&D)\.\.\.

let message_revert="�ēǍ����܂���?"
amenu <silent> 10.330 &File.�ēǍ�(&U)<Tab>:e!  :if confirm(message_revert, "&Yes\n&No")==1<Bar> e! <Bar> endif<CR>
amenu <silent> 10.331 &File.�o�b�t�@�폜(&K)<Tab>:bd  :confirm bd<CR>
amenu <silent> 10.340 &File.�ۑ�(&W)<Tab>:w  :if expand('%') == ''<Bar>browse confirm w<Bar>else<Bar>confirm w<Bar>endif<CR>
amenu <silent> 10.341 &File.�X�V���ۑ�(&S)<Tab>:update  :if expand('%') == ''<Bar>browse confirm w<Bar>else<Bar>confirm update<Bar>endif<CR>
amenu <silent> 10.400 &File.���o�b�t�@�����\��(&D)<Tab>:DiffOrig  :DiffOrig<CR>
amenu <silent> 10.401 &File.���o�b�t�@�ƍ����\��(&D)<Tab>:Diff\ #  :Diff #<CR>
amenu <silent> 10.402 &File.�����\��(&D)<Tab>:Diff  :browse vertical diffsplit<CR>

