# homebrewでインストールしたものを優先
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/matsumi/Library/Android/sdk/platform-tools:/Users/matsumi/Library/Android/sdk/tools
export PATH

# 補完機能 だよ
autoload -Uz compinit
compinit

# 文字コード
export LANG=ja_JP.UTF-8

# プロンプトに色付け
autoload -U colors; colors

# 一般ユーザ時
tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
	tmp_prompt="%B%U${tmp_prompt}%u%b"
	tmp_prompt2="%B%U${tmp_prompt2}%u%b"
	tmp_rprompt="%B%U${tmp_rprompt}%u%b"
	tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$tmp_rprompt  # 右側のプロンプト
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト

# lsをまともな色に
export CLICOLOR="true"
export LSCOLORS="Exfxcxdxbxegedabagacad"

# コマンド履歴
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history


# コマンド履歴から検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


# ディレクトリ名だけで移動
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups


# ターミナルタイトル
chpwd() {
		echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"
}

# 自作スクリプトへのPATH
if [ -d $HOME/Tools ]
	then
	    PATH=$PATH:$HOME/Tools; export PATH
fi

##### 各種エイリアス#####
alias ls='ls -GwF'
alias grep='find . -type f -name "*.*" | xargs grep'
alias viewcolor='for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo'


# ファイル上限を増やす
ulimit -n 4096
