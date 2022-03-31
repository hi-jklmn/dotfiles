function fish_config --wraps='vim ~/.config/fish/config.fish' --description 'alias fish_config=vim ~/.config/fish/config.fish'
  vim ~/.config/fish/config.fish $argv; 
end
