set RUST_SRC_PATH /usr/lib/rustlib/src/rust/src

set FZF_DEFAULT_COMMAND rg --hidden --no-ignore --files

export EDITOR="nvim"

# Use neovim as man page viewer
export MANPAGER="nvim +Man!"
export MANWIDTH=80

# Java issues
export _JAVA_AWT_WM_NONREPARENTING=1

export FZF_DEFAULT_COMMAND="fd --hidden --exclude '.git'"
