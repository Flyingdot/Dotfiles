#
# env
set PATH /Users/dani/.dotnet/tools /Users/dani/.local/bin /user/local/bin /Users/dani/bin $PATH 
eval "$(/opt/homebrew/bin/brew shellenv)"
set -gx EDITOR nvim 

set fish_greeting 
starship init fish | source 
set -gx TERM xterm-256color 

# nvm
set --universal nvm_default_version lts

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
thefuck --alias | source

#
# completions
complete -f -c dotnet -a "(dotnet complete (commandline -cp))"


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
