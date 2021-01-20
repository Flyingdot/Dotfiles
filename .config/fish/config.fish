#
# stuff 
#
set fish_greeting
starship init fish | source
fish_vi_key_bindings

#
# env
#
set PATH /home/dani/.dotnet/tools $PATH

#determines search program for fzf, prefer rg
if type ag &> /dev/null
    set -x FZF_DEFAULT_COMMAND 'ag -p ~/.gitignore -g ""'
end
if type rg &> /dev/null
    set -x FZF_DEFAULT_COMMAND 'rg --files'
end

#
# aliases
#
alias ls "lsd"
alias dc "docker-compose"
thefuck --alias | source
