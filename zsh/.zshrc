# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
USER_PATH=/home/$(whoami)
if [[ $(whoami) == "root" ]]; then
    USER_PATH=/root
fi
# Path to your oh-my-zsh installation.
  export ZSH=$USER_PATH/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="sorin"
GEOMETRY_SYMBOL_PROMPT="▶"
GEOMETRY_SYMBOL_RPROMPT="▷"
# DEFAULT_USER="leo"
export FZF_BASE=/usr/bin/fzf
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bundler
  dotenv
  osx
  rake
  ruby
  rbenv
  zsh-autosuggestions
  zsh-completions
  fzf
)

source $ZSH/oh-my-zsh.sh

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

# ssh
export SSH_KEY_PATH="~/.ssh/cp_key"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source /usr/share/zsh/scripts/zplug/init.zsh

alias "cd.."="cd .."
autoload -U compinit && compinit

export QT_QPA_PLATFORMTHEME=gtk2
PATH=$PATH:$USER_PATH/.cargo/bin
PATH=$PATH:$USER_PATH/.gem/ruby/2.5.0/gems/colorls-1.1.1/exe
mkcd() { mkdir -p "$1" && cd "$1"; }
alias "ll"="colorls -l --group-directories-first --gs --dark"
alias "la"="colorls -Al --group-directories-first --gs --dark"
alias ":q"="exit"
alias "rm -rf /"="echo \"read mail really fast\""
alias "pls"="sudo \$(history | tail -n1 | cut --complement -d' ' -f1)"
alias "weather"="curl -s us.wttr.in/Berlin\?m | head -n 37"
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
# export FZF_COMPLETION_TRIGGER=''
export FZF_DEFAULT_OPTS='
    --color info:108,prompt:109,spinner:108,pointer:168,marker:168
'

zplug 'wfxr/forgit', defer:1
zplug 'b4b4r07/emoji-cli'
zplug 'MichaelAquilina/zsh-emojis'
zplug 'zdharma/fast-syntax-highlighting'
zplug 'micrenda/zsh-nohup'
zplug 'fALKENdk/mylocation'
zplug 'hcgraf/zsh-sudo'

zplug load

shrug() {
    echo $em_shrug
    echo $em_shrug | xsel -i -b
}

run() {
    nohup $* >/dev/null 2>&1 &
}

open() {
    nohup xdg-open $1 >/dev/null 2>&1 &
}

pw() {
    bw get password $1 | tr -d '\n' | xsel -i -b 
}

bw-unlock() {
    export BW_SESSION="$(bw unlock --raw)"
}

neofetch


