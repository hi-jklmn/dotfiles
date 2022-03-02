set RUST_SRC_PATH /usr/lib/rustlib/src/rust/src

set FZF_DEFAULT_COMMAND rg --hidden --no-ignore --files

alias preview="fzf --preview 'bat --color always {}'"

alias vim=nvim

export EDITOR="nvim"

# Use neovim as info page viewer
function viminfo 
	vim -R -M -c "Info $1 $2" +only
end

#alias info=viminfo

# Use neovim as man page viewer
export MANPAGER="nvim +Man!"
export MANWIDTH=80

alias fish_config="vim ~/.config/fish/config.fish"
alias sxhkd_config="vim ~/.config/sxhkd/sxhkdrc"
alias bspwm_config="vim ~/.config/bspwm/bspwmrc"

