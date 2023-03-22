#!/usr/bin/env zsh


setopt HIST_IGNORE_ALL_DUPS
bindkey -v
setopt CORRECT
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '
WORDCHARS=${WORDCHARS//[\/]}
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh
zmodload -F zsh/terminfo +p:terminfo
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key

# end zim nonsense
# now we make our install cooler
autoload -Uz promptinit
promptinit

user=$(whoami)

SPACESHIP_CHAR_SYMBOL="λ "
SPACESHIP_BATTERY_SHOW="false"
SPACESHIP_USER_SHOW="always"
SPACESHIP_USER_PREFIX="" # remove `with` before username
SPACESHIP_USER_SUFFIX="" # remove space before host
SPACESHIP_USER_COLOR="#00d7ff"
SPACESHIP_HOST_COLOR="#ff87df"
SPACESHIP_HOST_SHOW="never"
SPACESHIP_HOST_PREFIX="@:"
SPACESHIP_HOST_SUFFIX=""
SPACESHIP_DIR_COLOR="#ffafff"
SPACESHIP_PROMPT_ASYNC=false # my god it looks like shit?

SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  package       # Package version
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  time
)

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'

fi

alias zconf="nvim ~/.zshrc"
export PATH=$PATH:$HOME/.local/bin
export PATH=~/bin:$PATH
alias lg="lazygit"
alias ls='ls --color=auto'
alias l='ls -a --color=auto'
alias ll='ls -la'
alias n='nvim'
alias c='clear'

autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"

source ~/.tldr.complete
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH=$PATH:/usr/local/go/bin
alias cat='batcat'
