# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/aranorn/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="/home/aranorn/.local/bin:$PATH"
eval "$(oh-my-posh --config '/home/aranorn/posh/robbyrussell.omp.json' init bash)"


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Override mkdir command to cd into it right after directory creation
function mkdir
{
    command mkdir $1 && cd $1
}

. /home/aranorn/my-paths.conf
# start my main session
tmux_odoo_16() {
    session_name="odoo_16"
    if tmux has-session -t "$session_name" 2>/dev/null; then
        # Session exists, attach to it
        tmux attach-session -t "$session_name"
    else
        # Session doesn't exist, create it
        # and run odoo16 window and panes below
        fuser -k "$odoo_16_port"/tcp
        tmux new-session -d -s "$session_name" -n odoo16 \; \
            send-keys 'cd $odoo_16_wd && nvim .' C-m \; \
            split-window -h -p 5 \;\
            send-keys 'cd $odoo_16_wd' C-m \; \
            split-window -v -p 95 \;\
            send-keys 'bash /home/aranorn/odoo-16-start.sh' C-m \;
        tmux attach-session -t "$session_name"
    fi
}

tmux_odoo_17() {
    session_name="odoo_17"
    if tmux has-session -t "$session_name" 2>/dev/null; then
        # Session exists, attach to it
        tmux attach-session -t "$session_name"
    else
        # Session doesn't exist, create it
        # and run odoo16 window and panes below
        fuser -k "$odoo_17_port"/tcp
        tmux new-session -d -s "$session_name" -n odoo17 \; \
            send-keys 'cd $odoo_17_wd && nvim .' C-m \; \
            split-window -h -p 5 \;\
            send-keys 'cd $odoo_17_wd' C-m \; \
            split-window -v -p 95 \;\
            send-keys 'bash /home/aranorn/odoo-17-start.sh' C-m \;
        tmux attach-session -t "$session_name"
    fi
}

tmux_nvim_conf(){
    session_name="nv_conf"
    if tmux has-session -t "$session_name" 2>/dev/null; then
        tmux attach-session -t "$session_name"
    else
        tmux new-session -s "$session_name" "cd ~/.config/nvim && nvim ."
    fi
}

# my current workspace tmux session
tmux_cws(){
    session_name="cws"
    if tmux has-session -t "$session_name" 2>/dev/null; then
        tmux attach-session -t "$session_name"
    else
        tmux new-session -d -s "$session_name" -n "$session_name" \; \
            send-keys 'cd $my_cwsd && nvim .' C-m \; \
            split-window -h -p 15 \;\
            send-keys 'cd $my_cwsd' C-m \; \
            split-window -v -p 85 \; \
            send-keys 'cd $my_cwsd' C-m \; 
        tmux attach-session -t "$session_name"

    fi
}

# restart odoo 16 instance inside tmux session > window > pane above
odoo16_restart(){
    tmux send-keys -t odoo_16:0.2 C-c
    fuser -k "$odoo_16_port"/tcp
    tmux send-keys -t odoo_16:0.2 "bash /home/aranorn/odoo-16-start.sh" C-m
}

# restart odoo 16 instance inside tmux session > window > pane above
odoo17_restart(){
    tmux send-keys -t odoo_17:0.2 C-c
    fuser -k "$odoo_17_port"/tcp
    tmux send-keys -t odoo_17:0.2 "bash /home/aranorn/odoo-17-start.sh" C-m
}

# bash / home tmux session
b_home(){
    session_name="dotfiles"
    if tmux has-session -t "$session_name" 2>/dev/null; then
        tmux attach-session -t "$session_name"
    else
        tmux new-session -s "$session_name" "cd ~/my-dotfiles && nvim ." \; 
    fi
}

# open alacritty conf session
tmux_alacritty(){
    session_name="alacritty"
    if tmux has-session -t "$session_name" 2>/dev/null; then
        tmux attach-session -t "$session_name"
    else
        tmux new-session -s "$session_name" "nvim $alacritty_path"
    fi
}

# aliases to run my session
 alias o16="tmux_odoo_16"
 alias o17="tmux_odoo_17"
 alias osr="odoo16_restart"
 alias o17r="odoo17_restart"
 alias nv_conf="tmux_nvim_conf"
 alias cws="tmux_cws"
 alias alac="tmux_alacritty"
 alias bhome="b_home"

set -o vi 
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

. "$HOME/.asdf/asdf.sh"
# create alias to restart odoo 16 instance inside the tmux session>window>pane
. "$HOME/.cargo/env"
