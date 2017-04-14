"---------------------------------
" vimrc
"---------------------------------

"　文字コード設定
set encoding=utf-8
scriptencoding utf-8

" 機能別vimrc読み込み
if has('vim_starting')
	set runtimepath+=~/.vim/
	runtime! userautoload/*.vim
endif

"---------------------------------
" 基本設定
"---------------------------------

" 行数表示
set number

" ファイル読み込み時のエンコード
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp,default,latin

" 改行コード設定
set fileformats=unix,dos,mac

" 検索時のハイライト
set hlsearch

" vi互換モード抑制
set nocompatible

" 対応括弧をハイライト
set showmatch

" カーソル行をハイライト
set cursorline

" バックアップファイルを作らない
set nobackup

" インデント設定
set smartindent

" タブ、スペースの間隔設定
set ts=4 sw=4 sts=4

"---------------------------------
" 操作関連
"---------------------------------

" <leader>の設定変更
let mapleader=","

" デフォルトの,を退避
noremap \ , 

" Esc2回 ハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" Control+T to N or P 次or前のタブに移動
nmap <C-T><C-N> :tabnext<CR><ESC>
nmap <C-T><C-P> :tabprevious<CR><ESC>

" VimShell関連Map
nnoremap [vimshell] <Nop>
nmap <Leader>c [vimshell]
nnoremap <silent> [vimshell]c :VimShell<CR>

