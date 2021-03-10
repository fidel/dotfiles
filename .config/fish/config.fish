status --is-interactive; and source (rbenv init -|psub)
set -g fish_user_paths "/usr/local/opt/node@14/bin" $fish_user_paths

function git 
  env LC_ALL=en_US.UTF-8 git $argv
end
