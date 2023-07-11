function gcamp --description 'git commit and push'
	git add --all && git commit -m $argv && git push
end
