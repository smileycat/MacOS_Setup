export ZSH=/Users/$(id -un)/.oh-my-zsh
export PATH="$PATH:/opt/homebrew/bin"

ZSH_THEME="bullet-train"
BULLETTRAIN_PROMPT_ORDER=(
	time
	dir
	git
	status
	virtualenv
)

BULLETTRAIN_DIR_FG="white"
BULLETTRAIN_DIR_BG="6"

BULLETTRAIN_TIME_FG="black"
BULLETTRAIN_TIME_BG="white"

BULLETTRAIN_GIT_FG="black"
BULLETTRAIN_GIT_BG="white"

plugins=(git macos zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
