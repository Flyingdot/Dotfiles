# Defined in - @ line 1
function config --wraps='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' --wraps='/usr/bin/git --git-dir=/home/dani/.cfg/ --work-tree=/home/dani' --description 'alias config /usr/bin/git --git-dir=/home/dani/.cfg/ --work-tree=/home/dani'
  /usr/bin/git --git-dir=/home/dani/.cfg/ --work-tree=/home/dani $argv;
end

