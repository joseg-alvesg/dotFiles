function ubuntutest --wraps='docker run -it --rm --name ubuntuTest ubuntu bash' --description 'alias ubuntutest=docker run -it --rm --name ubuntuTest ubuntu bash'
  docker run -it --rm --name ubuntuTest ubuntu bash $argv
        
end
