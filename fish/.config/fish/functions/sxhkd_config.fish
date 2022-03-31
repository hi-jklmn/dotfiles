function sxhkd_config --wraps='vim ~/.config/sxhkd/sxhkdrc' --description 'alias sxhkd_config=vim ~/.config/sxhkd/sxhkdrc'
  vim ~/.config/sxhkd/sxhkdrc $argv; 
end
