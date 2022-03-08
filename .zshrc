#!/usr/bin/env zsh

user=$(whoami)

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

source ~/.antiplugins.txt

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

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'

fi

alias zshconfig="nvim ~/.zshrc"


export PATH=$PATH:$HOME/.local/bin
export PATH=~/bin:$PATH
alias lg="lazygit"

autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"
eval "$(atuin init zsh)"

source ~/.tldr.complete
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

antibody() {
	case "$1" in
	bundle)
		source <( /home/taskylizard/bin/antibody $@ ) || /home/taskylizard/bin/antibody $@
		;;
	*)
		/home/taskylizard/bin/antibody $@
		;;
	esac
}

_antibody() {
	IFS=' ' read -A reply <<< "help bundle update home purge list init"
}
compctl -K _antibody antibody

# cry about this, ash
alias config='/usr/bin/git --git-dir=/home/taskylizard/.cfg/ --work-tree=/home/taskylizard'
