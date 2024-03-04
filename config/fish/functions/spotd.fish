function spotd --wraps='spotifyd --config-path .config/spotifyd.conf --no-daemon & disown' --description 'alias spotd=spotifyd --config-path .config/spotifyd.conf --no-daemon & disown'
  spotifyd --config-path .config/spotifyd.conf --no-daemon &> /dev/null & disown
end
