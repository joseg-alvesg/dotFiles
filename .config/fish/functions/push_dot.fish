function push_dot
  cd $HOME/dotFiles/
  if test -z $argv
    git add .
    git commit -m "update"
    git push
  else
    git add --all
    git commit -m $argv
    git push
  end

  cd $HOME/
end
