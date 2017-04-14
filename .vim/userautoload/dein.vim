"---------------------------------
" dein.vim
"---------------------------------

" $B%W%i%0%$%s$,%$%s%9%H!<%k$5$l$k%G%#%l%/%H%j(B
let s:dein_plugins_dir = expand('~/.vim/dein/plugins')

" dein.vim$BK\BN(B
let s:dein_dir = expand('~/.vim/dein/dein.vim')

" dein.vim $B$,$J$1$l$P(B github $B$+$iMn$H$7$F$/$k(B
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_dir, ':p')
endif

" $B@_Dj3+;O(B
if dein#load_state(s:dein_plugins_dir)
  call dein#begin(s:dein_plugins_dir)

  " $B%W%i%0%$%s%j%9%H$r<}$a$?(B TOML $B%U%!%$%k(B
  " $BM=$a(B TOML $B%U%!%$%k!J8e=R!K$rMQ0U$7$F$*$/(B
  let s:toml =  expand('~/.vim/userautoload/dein.toml')

  " TOML $B$rFI$_9~$_!"%-%c%C%7%e$7$F$*$/(B
  call dein#load_toml(s:toml,      {'lazy': 0})

  " $B@_Dj=*N;(B
  call dein#end()
  call dein#save_state()
endif

" $B$b$7!"L$%$%s%9%H!<%k$b$N$b$N$,$"$C$?$i%$%s%9%H!<%k(B
if dein#check_install()
  call dein#install()
endif

