"---------------------------------
" dein.vim
"---------------------------------

" プラグインがインストールされるディレクトリ
let s:dein_plugins_dir = expand('~/.vim/dein/plugins')

" dein.vim本体
let s:dein_dir = expand('~/.vim/dein/dein.vim')

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_plugins_dir)
  call dein#begin(s:dein_plugins_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let s:toml =  expand('~/.vim/userautoload/dein.toml')

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

