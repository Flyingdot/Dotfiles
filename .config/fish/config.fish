set fish_greeting 
starship init fish | source 
set -gx TERM xterm-256color 
fish_vi_key_bindings

figlet Snapbean | lolcat

# env
set PATH /Users/dani/.dotnet/tools /Users/dani/.local/bin $PATH 
set -gx EDITOR nvim 

# aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

#determines search program for fzf, prefer rg
if type ag &> /dev/null
    set -x FZF_DEFAULT_COMMAND 'ag -p ~/.gitignore -g ""' end if type rg &> /dev/null
    set -x FZF_DEFAULT_COMMAND 'rg --files' 
end

#
# aliases
#
alias ls "lsd" 
alias dc "docker-compose" 
alias vim nvim 
thefuck --alias | source
