function archtest --wraps='docker exec -it --rm --name archTest bash' --wraps='docker run -it --rm --name archTest bash' --wraps='docker run -it --rm --name archTest archlinux bash' --description 'alias archtest=docker run -it --rm --name archTest archlinux bash'
  docker run -it --rm --name archTest archlinux bash $argv
        
end
