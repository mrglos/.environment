# # The following lines were added by compinstall
#
# zstyle ':completion:*' completer _expand _complete _ignored
# zstyle :compinstall filename '/home/marekglos/.zshrc'
#
# autoload -Uz compinit
# compinit
# # End of lines added by compinstall
# # Lines configured by zsh-newuser-install
# HISTFILE=~/.histfile
# HISTSIZE=5000
# SAVEHIST=10000
# bindkey -e
# # End of lines configured by zsh-newuser-install

fpath=($ZDOTDIR/plugins $fpath)
fpath=($ZDOTDIR/prompts $fpath)

# --- from nrfutil completion install (modifies fpath) ---
[[ -r "${HOME}/.nrfutil/share/nrfutil-completion/scripts/zsh/setup.zsh" ]] && . "${HOME}/.nrfutil/share/nrfutil-completion/scripts/zsh/setup.zsh"

zmodload zsh/complist

setopt histsavenodups

autoload -Uz compinit
compinit

bindkey '^R' history-incremental-search-backward

autoload -Uz basic
basic

# --- vim ---
bindkey -v

source "$ZDOTDIR/plugins/cursor-mode.zsh"

# --- fzf ---
if [ $(command -v "fzf") ]; then
	# This replaces default back-i-search
	source /usr/share/fzf/shell/key-bindings.zsh

	# Set fzf default options
	export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

	# Set fzf preview window
	# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
	# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
	# export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
	# export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}' --preview-window right:60%:wrap"
	# export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -100' --preview-window right:60%:wrap"
	export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
	   --border \
	   --height 40% \
	   --layout=reverse \
	   --color=bg+:#1b2328 \
	   --color=fg:#d1dbe0 \
	   --color=fg+:#d1dbe0 \
	   --color=hl:#3d505c \
	   --color=hl+:#3d505c \
	   --color=border:#1f282e \
	   --color=info:#70afdb \
	   --color=marker:#a670db \
	   --color=pointer:#ff007b \
	   --color=prompt:#ff007b \
	   --color=spinner:#ff007b \
	   --color=header:#7082db"
fi

# --- aliases ---
source $ZDOTDIR/aliases.zsh

# --- commands ---
source $ZDOTDIR/commands.zsh

# --- direnv ---
if [ $(command -v "direnv") ]; then
	eval "$(direnv hook zsh)"
fi
