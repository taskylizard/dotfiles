export ZSH="/home/taskylizard/.oh-my-zsh"
ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  package       # Package version
  venv          # virtualenv section
  pyenv         # Pyenv section
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  user
  host
  time
)

SPACESHIP_CHAR_SYMBOL="λ "
SPACESHIP_BATTERY_SHOW="false"
SPACESHIP_USER_SHOW="always"
SPACESHIP_USER_PREFIX="" # remove `with` before username
SPACESHIP_USER_SUFFIX="" # remove space before host
SPACESHIP_USER_COLOR="#00d7ff"
SPACESHIP_HOST_COLOR="#ff87df"
SPACESHIP_HOST_SHOW="always"
SPACESHIP_HOST_PREFIX="@:"
SPACESHIP_HOST_SUFFIX=""
SPACESHIP_DIR_COLOR="#ffafff"

plugins=(
  git
  fzf
  history
  pip
  python
  fancy-ctrl-z
  web-search
  zsh-autosuggestions
  zsh-completions
  man
  zsh-interactive-cd
  colored-man-pages
  crystal
  undollar
  zshfl
)

source $ZSH/oh-my-zsh.sh

CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"

compinit -d ~/.zcompdump_custom

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'

fi

skip_global_compinit=1

alias zshconfig="nvim ~/.zshrc"
export PATH=$PATH:/home/taskylizard/.local/bin
export PATH=~/bin:$PATH
source /home/taskylizard/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias lg="lazygit"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"
source ~/.tldr.complete

alias luamake=/home/taskylizard/Documents/lua-language-server/3rd/luamake/luamake

export PNPM_HOME="/home/taskylizard/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

