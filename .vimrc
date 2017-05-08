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

" undoファイルの置き場所定義
set undodir=~/.vim/backup/vimundo

" swapファイルの置き場所定義
set directory =~/.vim/backup/swap

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

"------------ VimShell関連 ------------
nnoremap [vimshell] <Nop>
nmap <Leader>c [vimshell]
nnoremap <silent> [vimshell]c :VimShell<CR>

let g:vimshell_no_save_history_commands = {}									" historyに保存しないコマンドリスト({}ですべてのコマンド保存)

"------------ VimFiler関連 ------------
nnoremap [vimfiler] <Nop>
nmap <Leader>f [vimfiler]
nnoremap <silent> [vimfiler]c :VimFilerBufferDir<CR>

let g:vimfiler_safe_mode_by_default = 0											" vimfilerの安全モードはoff
let g:vimfiler_data_directory = '~/.vim/backup/vimfiler'						" vimfilerのバックアップディレクトリ定義

"------------ unite関連 ------------
nnoremap [unite] <Nop>
nmap <Leader>u [unite]
nnoremap <silent> [unite]u :Unite file_mru<CR>

au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>					" ESC2回押しでuniteを閉じる
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>				" ESC2回押しでuniteを閉じる

let g:unite_enable_start_insert = 1												" 入力状態でuniteを起動
let g:unite_source_file_mru_limit = 1000										" ファイル履歴上限を1000に設定
let g:unite_data_directory = '~/.vim/backup/unite'								" uniteのバックファップディレクトリ定義
