# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/saifdotfiles/zsh/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
  ZSH_THEME="robbyrussell"
# ZSH_THEME="refined"

# ZSH_THEME="miloshadzic"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
  DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	vi-mode
	per-directory-history
	colored-man-pages
	web-search
	pj
	autojump
	zsh-syntax-highlighting
	zsh-autosuggestions
	fzf-zsh-plugin
	)
source $ZSH/oh-my-zsh.sh


 [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#Some Problem with Bindkey
#bindkey -v
#bindkey "OH" beginning-of-line # Home
#bindkey "OF" end-of-line # End
#bindkey "[5~" beginning-of-history # PageUp
#bindkey "[6~" end-of-history # PageDown
#bindkey "[2~" quoted-insert # Ins
#bindkey "[3~" delete-char # Del
#
#bindkey "OB[A" history-beginning-search-backward
#bindkey "\e[B" history-beginning-search-forward

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi
if [[ -n "$TMUX" ]]; then
	bindkey "[1~" beginning-of-line # Home
	bindkey "[4~" end-of-line # End
	bindkey "OH" beginning-of-line # Home
	bindkey "OF" end-of-line # End
#bindkey "[5~" beginning-of-history # PageUp
fi
	bindkey "[1~" beginning-of-line # Home
	bindkey "[4~" end-of-line # End

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias odu="onedrive --synchronize --no-remote-delete"
alias od1="onedrive --synchronize --no-remote-delete --single-directory 'Research/Paperworks' " 
alias odd1="onedrive --synchronize --download-only --no-remote-delete --single-directory 'Research/Paperworks' " 
alias odd="onedrive --synchronize --download-only --no-remote-delete" 
alias odstatus="systemctl status --user  onedrive"
alias stokes-add="{sleep .1; cat ~/.ssh/msaifuddin-keys/msaifuddin_passphrase_1.txt; }|script -q /dev/null -c 'ssh-add ~/.ssh/msaifuddin-keys/msaifuddin_id_rsa_1'"
alias mystokes-ssh=" ssh -Y -i ~/.ssh/msaifuddin-keys/msaifuddin_id_rsa_1 msaifuddin@stokes.ist.ucf.edu"
alias mzstokes-add="{sleep .1; cat ~/.ssh/mzaman-keys/mzaman_passphrase_1.txt; }|script -q /dev/null -c 'ssh-add ~/.ssh/mzaman-keys/mzaman_id_rsa_1'"
alias mzstokes-ssh=" ssh -Y -i ~/.ssh/mzaman-keys/mzaman_id_rsa_1 mzaman@stokes.ist.ucf.edu"
alias mzstokes="mzaman@stokes.ist.ucf.edu"
alias mystokes="msaifuddin@stokes.ist.ucf.edu"
alias echoalias="alias \"$1\" | grep -o -P '(?<=\=).*'"
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
#alias vim='nvim -S ~/.vimrc'
alias svim='nvim -u ~/.SpaceVim/vimrc'
alias rvim=' vim -S ./.vimrc' 
#Autojump instruction
[[ -s /home/saif/.autojump/etc/profile.d/autojump.sh ]] && source /home/saif/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

alias xstart="xpra start :7 && DISPLAY=:7 xterm &"
alias xshare="xpra shadow :0"
alias xstop="xpra stop :7"
alias xnoshare="xpra stop :0"


