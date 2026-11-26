# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/dani/.docker/bin"
# End of Docker Desktop section.

#
# env
set PATH /Users/dani/.dotnet/tools /Users/dani/.local/bin /user/local/bin /Users/dani/bin $HOME/.local/bin $PATH 
eval "$(/opt/homebrew/bin/brew shellenv)"
set -gx EDITOR nvim 

# pnpm
set -gx PNPM_HOME "/Users/dani/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

set fish_greeting 
starship init fish | source 
set -gx TERM xterm-256color 

# nvm
function nvm
  bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end
set -x NVM_DIR ~/.nvm
nvm use default --silent

# # nvmrc
# function __use_nvmrc --on-variable PWD --description 'Use .nvmrc if it exists'
#     # Look for .nvmrc in current directory
#     if test -f .nvmrc
#         set -l node_version (nvm version)
#         set -l nvmrc_version (nvm version (cat .nvmrc))
#
#         # If version is not installed, install it
#         if test $nvmrc_version = "N/A"
#             nvm install
#         # If different from current, switch
#         else if test $nvmrc_version != $node_version
#             nvm use
#         end
#     end
# end
#
# # Run once on startup too
# __use_nvmrc

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
alias config-secret='/usr/bin/git --git-dir=$HOME/.cfg-secret/ --work-tree=$HOME'
alias ls "lsd" 
alias dc "docker-compose" 
alias vim nvim 
alias cc "clear && fish"
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

# pnpm
set -gx PNPM_HOME "/Users/dani/Library/pnpm"
if not string match -q -- "$PNPM_HOME/bin" $PATH
  set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end
