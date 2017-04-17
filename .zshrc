# homebrew$B$G%$%s%9%H!<%k$7$?$b$N$rM%@h(B
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/matsumi/Library/Android/sdk/platform-tools:/Users/matsumi/Library/Android/sdk/tools
export PATH

# $BJd405!G=(B $B$@$h(B
autoload -Uz compinit
compinit

# $BJ8;z%3!<%I(B
export LANG=ja_JP.UTF-8

# $B%W%m%s%W%H$K?'IU$1(B
autoload -U colors; colors

# $B0lHL%f!<%6;~(B
tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# root$B%f!<%6;~(B($BB@;z$K$7!"%"%s%@!<%P!<$r$D$1$k(B)
if [ ${UID} -eq 0 ]; then
	tmp_prompt="%B%U${tmp_prompt}%u%b"
	tmp_prompt2="%B%U${tmp_prompt2}%u%b"
	tmp_rprompt="%B%U${tmp_rprompt}%u%b"
	tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt    # $BDL>o$N%W%m%s%W%H(B
PROMPT2=$tmp_prompt2  # $B%;%+%s%@%j$N%W%m%s%W%H(B($B%3%^%s%I$,(B2$B9T0J>e$N;~$KI=<($5$l$k(B)
RPROMPT=$tmp_rprompt  # $B1&B&$N%W%m%s%W%H(B
SPROMPT=$tmp_sprompt  # $B%9%Z%kD{@5MQ%W%m%s%W%H(B

# ls$B$r$^$H$b$J?'$K(B
export CLICOLOR="true"
export LSCOLORS="Exfxcxdxbxegedabagacad"

# $B%3%^%s%IMzNr(B
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history


# $B%3%^%s%IMzNr$+$i8!:w(B
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


# $B%G%#%l%/%H%jL>$@$1$G0\F0(B
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups


# $B%?!<%_%J%k%?%$%H%k(B
chpwd() {
		echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"
}

# $B<+:n%9%/%j%W%H$X$N(BPATH
if [ -d $HOME/Tools ]
	then
	    PATH=$PATH:$HOME/Tools; export PATH
fi

##### $B3F<o%(%$%j%"%9(B#####
alias ls='ls -GwF'
alias grep='find . -type f -name "*.*" | xargs grep'
alias viewcolor='for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo'


# $B%U%!%$%k>e8B$rA}$d$9(B
ulimit -n 4096
