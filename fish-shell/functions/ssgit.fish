function ssgit --wraps='pass -c ssh/github' --description 'alias ssgit=pass -c ssh/github'
  pass -c ssh/github $argv
        
end
