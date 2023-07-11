function minttest --wraps='docker run -it --rm --name minttest linuxmintd/mint21.2-amd64:latest bash' --description 'alias minttest=docker run -it --rm --name minttest linuxmintd/mint21.2-amd64:latest bash'
  docker run -it --rm --name minttest linuxmintd/mint21.2-amd64:latest bash $argv
        
end
