if [ (dark-notify -e) = light ]
    source $__fish_config_dir/dayfox.fish
else
    source $__fish_config_dir/nightfox.fish
end
