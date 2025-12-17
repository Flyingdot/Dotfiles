#
# env
set PATH /Users/dani/.dotnet/tools /Users/dani/.local/bin /user/local/bin /Users/dani/bin $PATH 
eval "$(/opt/homebrew/bin/brew shellenv)"
set -gx EDITOR nvim 

set fish_greeting 
starship init fish | source 
set -gx TERM xterm-256color 

# nvm
function nvm
  bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end
set -x NVM_DIR ~/.nvm
nvm use default --silent

# gitignore.io
printf "function gi\n\tcurl -sL https://www.toptal.com/developers/gitignore/api/\$argv\nend\n" > \
~/.config/fish/functions/gi.fish

#
# Keybindings
fish_vi_key_bindings
bind -M insert \cf accept-autosuggestion

#
# determines search program for fzf, prefer rg
if type ag &> /dev/null
    set -x FZF_DEFAULT_COMMAND 'ag -p ~/.gitignore -g ""' end if type rg &> /dev/null
    set -x FZF_DEFAULT_COMMAND 'rg --files' 
end

#
# aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ls "lsd" 
alias dc "docker-compose" 
alias vim nvim 
alias cc "clear && fish"
alias mux tmuxinator
alias lg lazygit

#
# completions
complete -f -c dotnet -a "(dotnet complete (commandline -cp))"

# zoxide
zoxide init --cmd cd fish | source

# yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

if status is-interactive
    atuin init fish | source
end

#
# autoswitch nvm
function __check_nvm --on-variable PWD --description 'Auto nvm use on directory change'
  if test -f .nvmrc
    set node_version (nvm current)
    set nvmrc_node_version (nvm current (cat .nvmrc))

    if [ $nvmrc_node_version = "N/A" ]
      nvm install
    else if [ $nvmrc_node_version != $node_version ]
      nvm use
    end
  end
end

# Run once at shell start
__check_nvm
