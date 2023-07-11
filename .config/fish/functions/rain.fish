function rain --wraps=curl\ http://wttr.in/\\\?lang=pt-br --description alias\ rain=curl\ http://wttr.in/\\\?lang=pt-br
  curl http://wttr.in/\?lang=pt-br $argv
        
end
