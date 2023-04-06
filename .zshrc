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
eval "$(starship init zsh)"

SPACESHIP_CHAR_SYMBOL="λ "
SPACESHIP_USER_COLOR="#00d7ff"
SPACESHIP_HOST_COLOR="#ff87df"
SPACESHIP_DIR_COLOR="#ffafff"

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

function finstall {
  PACKAGE_NAME=$(apt-cache search $1 | fzf | cut --delimiter=" " --fields=1)
  if [ "$PACKAGE_NAME" ]; then
    echo "Installing $PACKAGE_NAME"
    sudo apt install $PACKAGE_NAME
    fi
}
alias finstall=finstall
alias zconf="nvim ~/.zshrc"
export PATH=$PATH:$HOME/.local/bin
export PATH=~/bin:$PATH
alias lg="lazygit"
alias ls='ls --color=auto'
alias l='ls -a --color=auto'
alias ll='ls -la'
alias n='nvim'
alias c='clear'
alias edit="fzf --ansi --preview='bat {}' --bind shift-up:preview-page-up,shift-down:preview-page-down --print0 | xargs -0 -o nvim"
alias pf="fzf --ansi --preview='cat {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"
alias gitf="git log --oneline --decorate --color | fzf --ansi --preview 'git show $(echo {} | cut -d" " -f1)'"

autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"

source ~/.tldr.complete
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH=$PATH:/usr/local/go/bin
alias cat='batcat'
alias bat='batcat'
export BAT_THEME="TokyoNight"

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
