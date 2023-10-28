# if [ -e .bashrc ]; then 
#   source .bashrc
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh/

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z git zsh-autosuggestions zsh-completions zsh-syntax-highlighting fzf-tab)


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

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



export BIN_PATH=${HOME}/.local/bin
export PATH=$SCRIPT_PATH:$BIN_PATH:$_LD_LIBRARY_PATH:/usr/local/bin:$PATH
export LD_LIBRARY_PATH=${HOME}/.local/lib:$LD_LIBRARY_PATH


alias ls="exa --color=auto --icons"
alias la="ls -a"
alias l="ls -l"
alias lla="ls -al"
alias lt="ls --tree"
alias h="cd ~"
alias c="clear"
alias b="cd ../"
alias bb="cd ../../"
alias bbb="cd ../../../"
alias bbbb="cd ../../../../"
alias bbbbb="cd ../../../../../"
alias bbbbbb="cd ../../../../../../"
alias bbbbbbb="cd ../../../../../../../"
alias bbbbbbbb="cd ../../../../../../../../"
alias bbbbbbbbb="cd ../../../../../../../../../"
alias bbbbbbbbbb="cd ../../../../../../../../../../"
#alias cat="bat --color always --plain" # gnome 终端白色背景时看不到字
alias grep="grep --color=auto"
alias v="nvim"

# cdls()
# {
#   cd "$1" && echo $(pwd) && exa --color=auto --icons -a
# }
# alias cd="cdls"
# zls()
# {
#   z "$1"
#   cdls
# }
# alias z="zls"

sshh() {
	sshd
	_ip="$(ifconfig | grep inet | grep -v '127.0.0.1' | sed -e 's/  */ /g'| awk -F ' ' '{print $2}')"
	echo "cmd: ssh $(whoami)@${_ip} -p 8022"
  echo "remember exit service use \"pkill sshd\""
}

# rust
export CARGO_TARGET_AARCH64_LINUX_ANDROID_LINKER=`which aarch64-linux-android-gcc`
export CFLAGS="-pie"
export CARGO_BUILD_TARGET=aarch64-linux-android


create_service() {
  svc_name="$1" cmd="$2" work_dir="$3"

  work_dir=$(pwd)

  dir_path="$PREFIX/var/service/$svc_name"

  mkdir -p "$dir_path/log"
  cd "$dir_path"
  ln -sf $PREFIX/share/termux-services/svlogger $dir_path/log/run

  echo '#!/data/data/com.termux/files/usr/bin/sh' > run
  #echo 'termux-wake-lock' >> run
  echo 'exec 2>&1' >> run
  if [ "$work_dir" != "" ]; then
    echo "cd '"$work_dir"'" >> run
  fi
  echo "exec '"$cmd"' 2>&1" >> run
  chmod +x run

  sv-enable "$svc_name"
  sv up "$svc_name"

  cd "$work_dir"
  # 可能需要重启设备
}