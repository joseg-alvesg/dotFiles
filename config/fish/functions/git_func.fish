function gcam
	git add --all && git commit -m $argv
end

function gcamp
	git add --all && git commit -m $argv && git push
end
