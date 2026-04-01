#
# ~/.bashrc
#

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="$HOME/.npm-global/bin:$PATH"
# Sửa lỗi trắng màn hình Java trên Arch Linux (Hyprland/Wayland)
export _JAVA_AWT_WM_NONREPARENTING=1
export VIRTUAL_ENV_DISABLE_PROMPT=1
export NO_AT_BRIDGE=1
export _JAVA_OPTIONS='-Dsun.java2d.opengl=false -Dsun.java2d.xrender=false'
export WB_FORCE_SYSTEM_COLORS=1

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '

alias ollama-on='sudo systemctl start ollama.service'
alias ollama-off='sudo systemctl stop ollama.service'
alias openclaw-gw-on='systemctl --user start openclaw-gateway.service'
alias openclaw-gw-off='systemctl --user stop openclaw-gateway.service'

eval "$(fzf --bash)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
