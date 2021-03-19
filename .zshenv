# Wayland
export MOZ_ENABLE_WAYLAND=1
export MOZ_WEBRENDER=1
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export _JAVA_AWT_WM_NONREPARENTING=1
export STUDIO_JDK=/usr/lib/jvm/java-11-openjdk

# Default programs
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export PATH="$PATH:/usr/local/bin:$HOME/.local/bin:$HOME/.cargo/bin"

# Config dirs
export LESSHISTFILE="-"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export PASSWORD_STORE_DIR="$HOME/.config/password-store"
export TEXMFHOME="$HOME/.config/texmf"
export ZDOTDIR="$HOME/.config/zsh"
