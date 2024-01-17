function startapps --wraps='dex -a -s .config/start/' --description 'alias startapps=dex -a -s .config/start/'
  dex -a -s .config/start/ $argv && exit
        
end
